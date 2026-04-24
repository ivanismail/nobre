import 'dart:convert';

import '../export.dart';
import '../models/error_validation_res_model.dart';
import '../models/message_res_model.dart';
import 'api_status.dart';

class ApiResponse {
  final ApiStatus? apiStatus;
  final String body;
  final int code;
  ApiResponse({
    this.apiStatus,
    required this.body,
    required this.code,
  });

  static ApiStatus getStatus(Response response) {
    if (response.statusCode == 408) return ApiStatus.timeout;
    if (response.statusCode == 302) return ApiStatus.found;
    if (response.statusCode == 404) return ApiStatus.notfound;
    if (response.statusCode == 400) return ApiStatus.error;
    if (response.statusCode == 402) return ApiStatus.errorvalidation;
    if (response.statusCode == 401) return ApiStatus.unauthorized;
    if (response.statusCode == 500) return ApiStatus.internalServer;
    if (response.statusCode == 429) return ApiStatus.serverBusy;

    return ApiStatus.success;
  }

  static String getErrorValidation(ApiResponse response) {
    ErrorValidationResModel errorValidationResModel =
        ErrorValidationResModel.fromJson(jsonDecode(response.body));

    return errorValidationResModel.errors!.values
        .toList()[0][0]
        .toString()
        .trim();
  }

  static MessageResModel getMessage(ApiResponse response) =>
      MessageResModel.fromJson(response.body);
}
