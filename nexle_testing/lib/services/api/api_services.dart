import 'package:nexle_testing/services/api/api_endpoints.dart';
import 'package:nexle_testing/services/api/http_manager.dart';

class APIService {
  APIService._init();
  static final APIService instance = APIService._init();

  final APIEndpoints _endPoints = APIEndpoints();
  final HttpManager _httpManager = HttpManager();
}
