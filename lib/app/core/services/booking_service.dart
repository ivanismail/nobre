import '../api_response.dart';
import '../service_http.dart';

class BookingService {
  static String _category = 'service-category';

  static Future<ApiResponse> getCategory() async {
    return await ServiceHttp.get(BookingService._category);
  }
}
