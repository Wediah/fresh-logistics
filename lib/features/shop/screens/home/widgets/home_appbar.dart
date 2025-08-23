import 'package:flutter/material.dart';
import 'package:freshlogistics/features/authentication/controllers/user_controller.dart';
import 'package:freshlogistics/features/shop/screens/cart/cart.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/text_strings.dart';


class FHomeAppBar extends StatelessWidget {
  const FHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return FAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextStrings.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey),
          ),
          Obx(() => Text(
            controller.userName,
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
          )),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()), 
          iconColor: Colors.white,
        )
      ],
    );
  }
}