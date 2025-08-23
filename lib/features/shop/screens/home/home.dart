import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:freshlogistics/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../common/widgets/success_screen/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your content here: PrimaryHeaderContainer, etc.
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  FHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FHomeAppBar extends StatelessWidget {
  const FHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextStrings.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey),
          ),
          Text(
            TextStrings.homeAppBarSubtitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(onPressed:  () {}, iconColor: Colors.white,)
      ],
    );
  }
}