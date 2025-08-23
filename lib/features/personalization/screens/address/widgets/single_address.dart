import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? AppColors.primaryGreen.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.lightGrayishGreen
              : AppColors.lightGrayishGreen,
      margin: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Icons.check_circle : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.white
                      : AppColors.primaryGreen.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Emmanuel Wediah',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Text('(+233) 244 567 890', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: Sizes.spaceBtwItems / 2),
              const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA', softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}
