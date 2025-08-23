import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class DeviceUtility {
  // ---------------------------
  // 1. Device Information
  // ---------------------------

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getCardColor(BuildContext context) {
    return isDarkMode(context) ? Colors.grey[850]! : Colors.white;
  }

  static Color getTextColor(BuildContext context) {
    return isDarkMode(context) ? Colors.white : Colors.black;
  }

  /// Checks if running on a physical device (not emulator/web)
  static Future<bool> get isPhysicalDevice async {
    if (kIsWeb) return false;
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return (await deviceInfo.androidInfo).isPhysicalDevice;
      } else if (Platform.isIOS) {
        return (await deviceInfo.iosInfo).isPhysicalDevice;
      }
    } on PlatformException {
      return false;
    }
    return false;
  }

  /// Gets device model name (e.g., "Pixel 6" or "iPhone 13")
  static Future<String> get deviceModel async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).model;
    } else if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).model;
    }
    return 'Unknown Device';
  }

  // ---------------------------
  // 2. Platform Checks
  // ---------------------------

  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;
  static bool get isWeb => kIsWeb;
  static bool get isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  static bool get isMobile => isAndroid || isIOS;

  /// Checks if device is a tablet based on screen size
  static bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  // ---------------------------
  // 3. Screen Utilities
  // ---------------------------

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  /// Gets current screen orientation
  static Orientation screenOrientation(BuildContext context) => 
      MediaQuery.of(context).orientation;

  /// Checks if keyboard is visible
  static bool isKeyboardOpen(BuildContext context) => 
      MediaQuery.of(context).viewInsets.bottom > 0;

  /// Hides the keyboard if open
  static void hideKeyboard(BuildContext context) => 
      FocusScope.of(context).unfocus();

  // ---------------------------
  // 4. Permission Helpers
  // ---------------------------

  /// Checks if permission is granted
  static Future<bool> hasPermission(Permission permission) async => 
      (await permission.status) == PermissionStatus.granted;

  /// Requests permission and returns result
  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status == PermissionStatus.granted;
  }

  // Common permission shortcuts
  static Future<bool> get hasCameraPermission => hasPermission(Permission.camera);
  static Future<bool> get hasLocationPermission => hasPermission(Permission.location);
  static Future<bool> get hasNotificationPermission => 
      hasPermission(Permission.notification);

  // ---------------------------
  // 5. Battery & Connectivity
  // ---------------------------

  static final Battery _battery = Battery();
  static final Connectivity _connectivity = Connectivity();

  /// Gets current battery level (1-100)
  static Future<int> get batteryLevel async => await _battery.batteryLevel;

  /// Checks if device is charging
  static Future<bool> get isCharging async =>
      (await _battery.batteryState) == BatteryState.charging;

  /// Checks internet connection status
  static Future<bool> get isOnline async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// Gets current connection type(s) (WiFi, mobile, etc.)
  static Future<List<ConnectivityResult>> get connectionType async => 
      await _connectivity.checkConnectivity();

  // ---------------------------
  // 6. App/Device Interaction
  // ---------------------------

  /// Launches a URL in default browser
  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Opens email app with pre-filled content
  static Future<void> sendEmail({
    required String to,
    String? subject,
    String? body,
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: to,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    await launchUrl(uri.toString());
  }

  /// Makes a phone call
  static Future<void> makePhoneCall(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(uri.toString());
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}