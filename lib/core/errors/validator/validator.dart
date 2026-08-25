class Validator {
  static String? validatePassword(
    String? value,
    String requiredMessage,
    String lengthMessage,
  ) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    if (value.length < 8) {
      return lengthMessage;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
    String requiredMessage,
    String matchMessage,
  ) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }

    if (value != password) {
      return matchMessage;
    }

    return null;
  }

  static String? validateEmail(
    String? value,
    String requiredMessage,
    String invalidMessage,
  ) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }
    final email = value.trim().toLowerCase();
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$',
    );
    if (!emailRegex.hasMatch(email)) {
      return invalidMessage;
    }
    final domain = email.split('@').last;
    const validTlds = {
      'com',
      'net',
      'org',
      'edu',
      'gov',
      'info',
      'biz',
      'io',
      'co',
      'me',
      'dev',
      'app',
      'tech',
      'ai',
      'eg',
    };
    final tld = domain.split('.').last;
    if (!validTlds.contains(tld)) {
      return invalidMessage;
    }
    return null;
  }
}
