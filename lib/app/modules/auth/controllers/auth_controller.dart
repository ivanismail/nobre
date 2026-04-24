import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/api_response.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/callback/auth_callback.dart';
import '../../../models/auth/login_req_model.dart';
import '../../../models/auth/login_res_model.dart';
import '../../../widgets/snackbar.dart';

class AuthController extends GetxController {
  //* LOGIN
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isLoading = false;

  void doLogin() async {
    if (phoneNumber.text.isEmpty) {
      return XSnackbar.danger(message: 'Email harus diisi');
    }
    if (pass.text.isEmpty) {
      return XSnackbar.danger(message: 'Password harus diisi');
    }

    isLoading = true;
    update();

    final req = LoginReqModel(
      phoneNumber: phoneNumber.text,
      password: pass.text,
      fcmToken: "fcm_token_device",
    );

    try {
      ApiResponse res = await AuthService.login(data: req.toJson());
      LoginResModel? loginResModel;

      if (res.code == 200) {
        try {
          loginResModel = LoginResModel.fromJson(res.body);
          await AuthCallback.login(loginResModel);
        } catch (e) {}
      } else {
        try {
          XSnackbar.danger(message: ApiResponse.getErrorValidation(res));
        } catch (e) {
          XSnackbar.danger(message: ApiResponse.getMessage(res).message!);
        }
      }
    } catch (e) {
      print("ERROR: $e");
    }

    isLoading = false;
    update();
  }
}
