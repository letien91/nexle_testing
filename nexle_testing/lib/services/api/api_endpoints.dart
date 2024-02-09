class ApiEndPoints {
  static const String baseUrl = 'http://streaming.nexlesoft.com:3001';

  String get signin => '$baseUrl/auth/signin';
  String get signup => '$baseUrl/auth/signup';
  String get getCategories => '$baseUrl/categories';
}
