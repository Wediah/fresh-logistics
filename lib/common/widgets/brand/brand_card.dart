import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verify_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
          padding: const EdgeInsets.all(Sizes.p2),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
              children: [
                Flexible(
                    child: CircularImage(
                      isNetworkImage: false,
                      image: ImageStrings.fruit,
                      backgroundColor: Colors.transparent,
                      overlayColor: HelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
                    )
                ),
                const SizedBox(width: Sizes.spaceBtwItems / 2),

                Expanded(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BrandTitleWithVerifiedIcon(title: 'His Ways', brandTextSize: TextSizes.large),
                          Text(
                            '256 products',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ]
                    )
                )
              ]
          )
      ),
    );
  }
}