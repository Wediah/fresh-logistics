class Validator {
  // ---------------------------
  // 1. Email Validation
  // ---------------------------
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    // RFC 5322 compliant regex
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // ---------------------------
  // 2. Password Validation
  // ---------------------------
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }

    return null;
  }

  // ---------------------------
  // 3. Phone Number Validation
  // ---------------------------
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone number is required';
    }

    // Supports international formats
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(phone)) {
      return 'Enter a valid phone number';
    }

    // Additional length check
    final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 9) {
      return 'Phone number too short';
    }

    return null;
  }

  // ---------------------------
  // 4. Generic Validators
  // ---------------------------
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? validateLength(
    String? value, {
    int min = 0,
    int? max,
    String? fieldName,
  }) {
    if (value == null) return null;

    if (min > 0 && value.length < min) {
      return '${fieldName ?? 'Field'} must be at least $min characters';
    }

    if (max != null && value.length > max) {
      return '${fieldName ?? 'Field'} must be less than $max characters';
    }

    return null;
  }

  // ---------------------------
  // 5. Credit Card Validation
  // ---------------------------
  static String? validateCreditCard(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Card number is required';
    }

    // Remove all non-digit characters
    final digits = cardNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Basic length check (13-19 digits)
    if (digits.length < 13 || digits.length > 19) {
      return 'Invalid card number length';
    }

    // Luhn algorithm check
    if (!_isLuhnValid(digits)) {
      return 'Invalid card number';
    }

    return null;
  }

  static bool _isLuhnValid(String digits) {
    int sum = 0;
    bool alternate = false;
    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = int.parse(digits[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      sum += digit;
      alternate = !alternate;
    }
    return (sum % 10) == 0;
  }
}