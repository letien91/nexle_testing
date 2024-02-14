class ApiEndPoints {
  static const String baseUrl = 'http://streaming.nexlesoft.com:3001';

  String get signin => '/auth/signin';
  String get signup => '/auth/signup';
  String get getCategories => '/categories';
}
