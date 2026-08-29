class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://fixnow.tryasp.net/api/';

  // Auth
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String verifyOtp = 'auth/verify-otp';
  static const String refreshToken = 'auth/refresh_token';
  static const String logout = 'auth/logout';

  // Password
  static const String forgotPassword = 'auth/forgot-password';
  static const String resetPassword = 'auth/reset-password';
}