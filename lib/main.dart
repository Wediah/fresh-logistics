import 'package:flutter/material.dart';
import 'package:freshlogistics/data/repositories/authentication_repository.dart';
import 'package:freshlogistics/data/repositories/cart_repository.dart';
import 'package:freshlogistics/data/services/firebase_service.dart';
import 'package:freshlogistics/utils/constants/colors.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase Service
  await Get.putAsync(() async {
    final service = FirebaseService();
    await service.onInit();
    return service;
  });
  
  // Initialize Authentication Repository
  final authRepo = Get.put(AuthenticationRepository());
  await authRepo.autoLogin(); // Auto-login anonymously for demo
  
  // Initialize Cart Repository
  Get.put(CartRepository());

  AppColors.primaryGreen; // Ensure AppColors is initialized
  runApp(const App());
}
