class Validation {
  static String? fieldvalidation(String? value, String field) {
    if (value!.isEmpty) {
      return 'Please enter $field';
    }

    return null;
  }

  static String? emaiValidation(String? value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? passworddValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? confirmPassword(String? value, String confirm) {
    RegExp regex = RegExp(r'^(?=.*).{6,}$');
    if (value != confirm) {
      return "Passwords don't match";
    } else if (!regex.hasMatch(value!)) {
      return 'Must have at least 6 characters.';
    } else {
      return null;
    }
  }

  static String? phoneNumberValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }

    // Regular expression to match phone numbers with country code
    RegExp regex = RegExp(r'^\+\d{1,3}\d{10,14}$');

    if (!regex.hasMatch(value)) {
      return 'Invalid phone number format. Please include country code starting with +';
    }

    return null;
  }
}
