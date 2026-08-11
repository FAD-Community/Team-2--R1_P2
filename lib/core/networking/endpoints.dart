class Endpoints {
  Endpoints._();
 
  static const String baseUrl = 'https://api.example.com/';
 
  // ------- Auth -------
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String refreshToken = 'auth/refresh';
 
  // ------- Users -------
  static const String profile = 'users/me';
  static const String users = 'users';
 
  // مثال endpoint بباراميتر
  static String userById(int id) => 'users/$id';
}
 