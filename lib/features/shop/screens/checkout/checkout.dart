import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:freshlogistics/common/widgets/success_screen/success_screen.dart';
import 'package:freshlogistics/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:freshlogistics/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:freshlogistics/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:freshlogistics/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:freshlogistics/navigation_menu.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: Sizes.spaceBtwSections),

              // Coupon TextField
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? AppColors.primaryGreen : AppColors.white,
                padding: const EdgeInsets.only(
                  top: Sizes.spaceBtwItems,
                  bottom: Sizes.spaceBtwItems,
                  right: Sizes.spaceBtwItems,
                  left: Sizes.spaceBtwItems,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Have a promo code? Enter here',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: dark ? AppColors.white.withOpacity(0.5) : AppColors.primaryGreen.withOpacity(0.5),
                          backgroundColor: AppColors.lightGrayishGreen.withOpacity(0.2),
                          side: BorderSide(color: AppColors.lightGrayishGreen.withOpacity(0.1)),
                        ),
                        child: const Text('Apply'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              // Billing Section
              RoundedContainer(
                padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                showBorder: true,
                backgroundColor: dark ? AppColors.primaryGreen : AppColors.white,
                child: Column(
                  children: [
                    // Pricing
                    BillingAmountSection(),
                    SizedBox(height: Sizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: Sizes.spaceBtwItems),

                    // Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: Sizes.spaceBtwItems),

                    // Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
