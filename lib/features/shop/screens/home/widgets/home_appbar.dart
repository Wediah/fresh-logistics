import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/text_strings.dart';


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