import 'package:logger/logger.dart';

/// Centralized logging utility with severity levels and crash reporting
class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,       // Number of method calls to show
      errorMethodCount: 5,  // Stack trace lines for errors
      colors: true,         // Colorful log messages
      printEmojis: true,    // Show emojis for log levels
    ),
  );

  // ---------------------------
  // 1. Logging Methods
  // ---------------------------

  /// Verbose debug logs (grey)
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Info logs (blue)
  static void i(dynamic message) {
    _logger.i(message);
  }

  /// Warning logs (yellow)
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Error logs (red)
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
    _reportCrash(error, stackTrace); // Auto-report errors
  }

  // ---------------------------
  // 2. Crash Reporting
  // ---------------------------
  static void _reportCrash(dynamic error, StackTrace? stackTrace) {
    // Integrate with Crashlytics/Sentry (example for Firebase Crashlytics)
    if (error != null) {
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  }

  // ---------------------------
  // 3. Network Logging Interceptor
  // ---------------------------
  static Logger get dioInterceptor => Logger(
        printer: PrettyPrinter(
          printTime: true, // Log request/response timing
        ),
      );
}