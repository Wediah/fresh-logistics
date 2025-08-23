import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/success_screen/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/home_controller.dart';
import 'package:get/get.dart';


class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) => controller.updatePageIndicator(index),
              ),
              items: banners.map((url) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal padding
                child: RoundedImage(
                    imageUrl: url,
                ),
              )).toList()
          ),
          const SizedBox(height: Sizes.spaceBtwChips),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    CircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carouselCurrentIndex.value == i ? Colors.lightGreenAccent : Colors.grey,
                    ),
                ],
              )
            )
          )
        ]
    );
  }
}