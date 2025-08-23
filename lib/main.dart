import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:freshlogistics/app.dart';
import 'package:freshlogistics/data/repositories/authentication_repository.dart';
import 'package:freshlogistics/data/repositories/product_repository.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/controllers/favorites_controller.dart';

/// Entry point of Flutter App
Future<void> main() async {
  
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize GetX Local Storage
  await GetStorage.init();

  // -- Initialize Firebase
  await Firebase.initializeApp();

  // Initialize repositories and controllers
  await _initializeServices();
  
  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}

/// Initialize all required services
Future<void> _initializeServices() async {
  // Initialize repositories
  await Get.putAsync(() async => AuthenticationRepository());
  await Get.putAsync(() async => ProductRepository());
  
  // Initialize controllers
  Get.put(ProductController());
  Get.put(FavoritesController());
}
