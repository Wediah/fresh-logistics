import 'package:intl/intl.dart';

class Formatter {
  // ---------------------------
  // 1. Date & Time Formatting
  // ---------------------------

  /// Format DateTime to 'dd-MM-yyyy' (e.g., "29-05-2024")
  static String formatDate(DateTime date) {
    return '${_twoDigits(date.day)}-${_twoDigits(date.month)}-${date.year}';
  }

  /// Format DateTime to 'HH:mm' (e.g., "14:30")
  static String formatTime(DateTime date) {
    return '${_twoDigits(date.hour)}:${_twoDigits(date.minute)}';
  }

  // Helper for two-digit formatting (e.g., "05" instead of "5")
  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  // ---------------------------
  // 2. Number Formatting
  // ---------------------------

  /// Format a number with commas (e.g., 1000 → "1,000")
  static String formatNumber(num value) {
    return NumberFormat('#,###').format(value);
  }

  /// Format a number as currency (e.g., 99.99 → "\$99.99")
  static String formatCurrency(num value, {String symbol = '\$'}) {
    return NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
    ).format(value);
  }

  // ---------------------------
  // 3. String Manipulation
  // ---------------------------

  /// Capitalize the first letter of a string (e.g., "hello" → "Hello")
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Truncate long text with ellipsis (e.g., "Very long text..." if over 20 chars)
  static String truncate(String text, {int maxLength = 20}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  // ---------------------------
  // 4. Custom Text Formats
  // ---------------------------

  /// Format a phone number (e.g., "1234567890" → "(123) 456-7890")
  static String formatPhoneNumber(String phone) {
    if (phone.length != 10) return phone; // Skip invalid formats
    return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}';
  }

  /// Format a percentage (e.g., 0.25 → "25%")
  static String formatPercentage(double value) {
    return '${(value * 100).round()}%';
  }
}