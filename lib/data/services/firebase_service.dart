import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  static FirebaseService get instance => Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    await initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        // Add your Firebase configuration here
        // options: DefaultFirebaseOptions.currentPlatform,
      );
      print('Firebase initialized successfully');
    } catch (e) {
      print('Firebase initialization failed: $e');
    }
  }
}
