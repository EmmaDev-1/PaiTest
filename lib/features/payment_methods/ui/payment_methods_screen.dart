import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/app_scafold.dart';
import '../../../widgets/components/app_text.dart';
import '../providers/payment_methods_provider.dart';
import '../ui/content/payment_method_body_content.dart';

class PaymentMethodsScreen extends ConsumerStatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PaymentMethodsScreen> createState() =>
      _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends ConsumerState<PaymentMethodsScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncMethods = ref.watch(paymentMethodsProvider);

    return asyncMethods.when(
      data: (methods) {
        return AppScaffold(
          padding: EdgeInsets.zero,
          isScrollable: false,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            title: AppText("Métodos de pago", fontSize: 16.sp),
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: PaymentMethodBodyContent(
            pageController: _pageController,
            methods: methods,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push('/create_payment_method'),
            label: AppText('Añadir método de pago', color: AppColors.white),
            backgroundColor: AppColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, _) => Scaffold(body: Center(child: AppText("Error: \$err"))),
    );
  }
}
