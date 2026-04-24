import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
import '../storage.dart';
import 'api_response.dart';

class ServiceHttp {
  static Future<ApiResponse> get(String url) async {
    String? token;
    if (GetStorage().hasData(XStorage.TOKEN)) {
      token = GetStorage().read(XStorage.TOKEN);
    }
    http.Response res = await http.get(
        Uri.parse('https://api-barbershop.hayaka.my.id/api/' + url),
        headers: {
          'Authorization': 'Bearer $token',
        }).timeout(
      TIMEOUT_DURATION,
      onTimeout: () {
        return http.Response('timeout', 408);
      },
    ).onError(
      (_, __) {
        return http.Response('timeout', 408);
      },
    );

    print(res.body);

    // ApiStatus apiStatus = ApiResponse.getStatus(res);

    return ApiResponse(body: res.body, code: res.statusCode);
  }

  static Future<ApiResponse> post(
      String url, Map<String, dynamic>? data) async {
    String? token;
    if (GetStorage().hasData(XStorage.TOKEN)) {
      token = GetStorage().read(XStorage.TOKEN);
    }
    var bodydata = data;
    var dataJson = json.encode(bodydata);
    http.Response res = await http
        .post(
          Uri.parse('https://api-barbershop.hayaka.my.id/api/' + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: dataJson,
        )
        .timeout(Duration(seconds: 30));

    log(dataJson.toString());

    return ApiResponse(body: res.body, code: res.statusCode);
  }
}
