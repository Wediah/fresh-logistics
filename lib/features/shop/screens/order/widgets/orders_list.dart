import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: Sizes.spaceBtwItems),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        backgroundColor: HelperFunctions.isDarkMode(context) ? AppColors.primaryGreen : AppColors.lightGrayishGreen,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                // Icon
                const Icon(Icons.local_shipping),
                const SizedBox(width: Sizes.spaceBtwItems / 2),
                
                // Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.primaryGreen, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                
                // Icon
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, size: Sizes.iconSm)),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Icons.label),
                      const SizedBox(width: Sizes.spaceBtwItems / 2),
                      
                      // Order
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: Sizes.spaceBtwItems / 2),
                      
                      // Shipping Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
