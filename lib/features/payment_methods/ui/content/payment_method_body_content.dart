import 'package:flutter/material.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/patment_method.dart';
import 'payment_method_card.dart';

/// Body content for the PaymentMethodsScreen.
/// Displays a carousel of payment method cards and an add button.
class PaymentMethodBodyContent extends StatelessWidget {
  final PageController pageController;
  final List<PaymentMethod> methods;

  const PaymentMethodBodyContent({
    Key? key,
    required this.pageController,
    required this.methods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.gap10h(),
        SizedBox(
          height: 28.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: methods.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final method = methods[index];
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  double page =
                      pageController.hasClients
                          ? (pageController.page ??
                              pageController.initialPage.toDouble())
                          : pageController.initialPage.toDouble();
                  double scale = (1 - (page - index).abs() * 0.3).clamp(
                    0.9,
                    1.0,
                  );
                  return Center(
                    child: Transform.scale(scale: scale, child: child),
                  );
                },
                child: PaymentMethodCard(
                  paymentMethod: method,
                  onSetPrimary: () {
                    // TODO: implement setting primary method
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
