// File: lib/features/create_payment_method/ui/screens/create_payment_method_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_scafold.dart';
import '../../../widgets/components/app_text.dart';
import '../../../widgets/components/app_text_field.dart';
import '../../../widgets/components/buttons/animated_background_button.dart';
import '../../../widgets/components/gaps.dart';
import '../../payment_methods/data/models/patment_method.dart';
import '../providers/create_payment_method_provider.dart';
import 'content/payment_method_preview_card.dart';

/// Screen that lets the user fill out the form and preview the card live.
/// Enforces MM/YY format on expiry field with valid month (01-12) and year >=25.
class CreatePaymentMethodScreen extends ConsumerStatefulWidget {
  const CreatePaymentMethodScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatePaymentMethodScreen> createState() =>
      _CreatePaymentMethodScreenState();
}

class _CreatePaymentMethodScreenState
    extends ConsumerState<CreatePaymentMethodScreen> {
  final _nameCtrl = TextEditingController();
  final _numberCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();
  final _bankCtrl = TextEditingController();

  bool _isCvvObscured = true;

  final GlobalKey<PaymentMethodPreviewCardState> _previewKey =
      GlobalKey<PaymentMethodPreviewCardState>();

  @override
  void initState() {
    super.initState();
    // Update preview on each change
    void listener() {
      final preview = PaymentMethod(
        id: 'tmp',
        cardHolderName: _nameCtrl.text,
        cardNumber: _numberCtrl.text,
        expirationDate: _expiryCtrl.text,
        cvv: _cvvCtrl.text,
        cardType: '',
        paymentNetwork: '',
        bankName: _bankCtrl.text,
        bankImage: '',
        cardBankTypeImage: '',
        isPrimary: false,
      );
      ref.read(paymentMethodPreviewProvider.notifier).state = preview;
    }

    _nameCtrl.addListener(listener);
    _numberCtrl.addListener(listener);
    _expiryCtrl.addListener(listener);
    _cvvCtrl.addListener(listener);
    _bankCtrl.addListener(listener);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _numberCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    _bankCtrl.dispose();
    super.dispose();
  }

  /// Form is valid if all fields are filled and expiry matches MM/YY with year >=25.
  bool get _isFormValid {
    final expiry = _expiryCtrl.text;
    final expiryValid = RegExp(
      r'^(0[1-9]|1[0-2])\/([2-9][0-9])$',
    ).hasMatch(expiry);
    return _nameCtrl.text.isNotEmpty &&
        _numberCtrl.text.length == 16 &&
        expiryValid &&
        _cvvCtrl.text.length == 3 &&
        _bankCtrl.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final preview = ref.watch(paymentMethodPreviewProvider);

    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: AppText("Añadir tarjeta", fontSize: 16.sp),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        children: [
          AppGaps.gap2h(),
          // Live preview of card
          PaymentMethodPreviewCard(
            paymentMethod: preview,
            key: _previewKey,
            isCvvObscured: _isCvvObscured,
          ),
          AppGaps.gap4h(),
          // Name
          AppTextField(
            controller: _nameCtrl,
            hintText: 'Nombre del Titular',
            fieldType: TextInputType.name,
          ),
          AppGaps.gap2h(),

          // Card number: only digits, max 16
          AppTextField(
            controller: _numberCtrl,
            hintText: 'Número de Tarjeta',
            fieldType: TextInputType.number,
            onChanged: (value) {
              final onlyDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
              final newText =
                  onlyDigits.length > 16
                      ? onlyDigits.substring(0, 16)
                      : onlyDigits;
              if (newText != value) {
                _numberCtrl.value = TextEditingValue(
                  text: newText,
                  selection: TextSelection.collapsed(offset: newText.length),
                );
              }
            },
          ),
          AppGaps.gap2h(),

          // Expiry and CVV
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: _expiryCtrl,
                  hintText: 'MM/AA',
                  fieldType: TextInputType.number,
                  onChanged: (value) {
                    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
                    String newText;
                    if (digitsOnly.length <= 2) {
                      if (digitsOnly.length == 2) {
                        final monthInt = int.parse(digitsOnly);
                        if (monthInt < 1) {
                          newText = '01';
                        } else if (monthInt > 12) {
                          newText = '12';
                        } else {
                          newText = digitsOnly;
                        }
                      } else {
                        newText = digitsOnly;
                      }
                    } else {
                      final monthDigits = digitsOnly.substring(0, 2);
                      final monthInt = int.parse(monthDigits);
                      String month;
                      if (monthInt < 1) {
                        month = '01';
                      } else if (monthInt > 12) {
                        month = '12';
                      } else {
                        month = monthDigits;
                      }
                      var year = digitsOnly.substring(2);
                      if (year.length > 2) year = year.substring(0, 2);
                      newText = '$month/$year';
                    }
                    if (newText != value) {
                      _expiryCtrl.value = TextEditingValue(
                        text: newText,
                        selection: TextSelection.collapsed(
                          offset: newText.length,
                        ),
                      );
                    }
                  },
                ),
              ),
              AppGaps.gap4w(),
              Expanded(
                child: AppTextField(
                  controller: _cvvCtrl,
                  hintText: 'CVV',
                  fieldType: TextInputType.number,
                  obscureText: _isCvvObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isCvvObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18.sp,
                      color: AppColors.mediumGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCvvObscured = !_isCvvObscured;
                      });
                    },
                  ),
                  onChanged: (value) {
                    final onlyDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
                    final newText =
                        onlyDigits.length > 3
                            ? onlyDigits.substring(0, 3)
                            : onlyDigits;
                    if (newText != value) {
                      _cvvCtrl.value = TextEditingValue(
                        text: newText,
                        selection: TextSelection.collapsed(
                          offset: newText.length,
                        ),
                      );
                    }
                  },
                  onTapOutside: (_) {
                    _previewKey.currentState?.flip();
                  },
                  onTap: () {
                    _previewKey.currentState?.flip();
                  },
                  onEditingComplete: () {
                    _previewKey.currentState?.flip();
                  },
                  onSubmitted: (_) {
                    _previewKey.currentState?.flip();
                  },
                ),
              ),
            ],
          ),
          AppGaps.gap2h(),

          // Bank name
          AppTextField(
            controller: _bankCtrl,
            hintText: 'Nombre del Banco',
            fieldType: TextInputType.text,
          ),
          AppGaps.gap2h(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AnimatedBackgroundButton(
          onPressed:
              _isFormValid
                  ? () {
                    ref.read(submitPaymentMethodProvider(preview).future).then((
                      created,
                    ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: AppText(
                            'Tarjeta creada: ${created.cardNumber}',
                            color: AppColors.white,
                          ),
                        ),
                      );
                      context.pop();
                    });
                  }
                  : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AppText(
                          'Por favor completa todos los campos correctamente.',
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
          text: 'Crear tarjeta',
        ),
      ),
    );
  }
}
