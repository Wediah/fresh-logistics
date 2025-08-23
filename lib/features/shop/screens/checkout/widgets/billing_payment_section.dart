import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/image_strings.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? AppColors.lightGrayishGreen : AppColors.white,
              padding: const EdgeInsets.all(Sizes.p8),
              child: const Image(image: AssetImage(ImageStrings.authBackground), fit: BoxFit.contain),
            ),
            const SizedBox(width: Sizes.spaceBtwItems / 2),
            Text('PayPal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
