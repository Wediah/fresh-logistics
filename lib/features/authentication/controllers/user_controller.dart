import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<User?> _user = FirebaseAuth.instance.currentUser.obs;
  User? get user => _user.value;
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user.bindStream(_auth.authStateChanges());
  }

  String get userName {
    return _user.value?.displayName ?? _user.value?.email ?? 'Guest';
  }
}
