import 'package:flutter/material.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:freshlogistics/utils/constants/colors.dart';

class FAppBarTheme{
  FAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: const IconThemeData(color: AppColors.black, size: Sizes.iconMd),
    actionsIconTheme: const IconThemeData(color: AppColors.black, size: Sizes.iconMd),
    titleTextStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.black),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: const IconThemeData(color: AppColors.black, size: Sizes.iconMd),
    actionsIconTheme: const IconThemeData(color: AppColors.white, size: Sizes.iconMd),
    titleTextStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.white),
  );
}