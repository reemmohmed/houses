class AppValidator {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.trim().isEmpty) {
      return "Display name cannot be empty";
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return "Display name must be between 3 and 20 characters";
    }
    return null; // ✅ صالح
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    ).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null; // ✅ صالح
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null; // ✅ صالح
  }
}
