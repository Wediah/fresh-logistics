import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Emmanuel Wediah', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: Sizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBtwItems),
            Text('+233-244-567-890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: Sizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBtwItems),
            Expanded(child: Text('South Liana, Maine 87665, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}
