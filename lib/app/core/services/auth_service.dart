import 'package:nobre/app/core/service_http.dart';

import '../api_response.dart';

class AuthService {
  static String loginRoute = 'auth/login';

  static Future<ApiResponse> login({Map<String, dynamic>? data}) async {
    return await ServiceHttp.post(AuthService.loginRoute, data);
  }
}
