import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  }
}
