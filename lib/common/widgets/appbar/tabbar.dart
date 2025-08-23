import 'package:flutter/material.dart';
import 'package:freshlogistics/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class FTabBar extends StatelessWidget implements PreferredSizeWidget {
  const FTabBar({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Material (
      color: dark ? Colors.grey : Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primaryGreen,
        unselectedLabelColor: Colors.grey,
        labelColor: dark ? Colors.white : Colors.black,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight());
}