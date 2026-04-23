import 'package:get_storage/get_storage.dart';

import '../../export.dart';
import '../../models/auth/login_res_model.dart';
import '../../routes/app_pages.dart';
import '../../storage.dart';

class AuthCallback {
  static Future<void> login(LoginResModel res) async {
    GetStorage().write(XStorage.TOKEN, res.data!.token.toString());
    GetStorage().write(XStorage.NAME, res.data!.user!.name.toString());
    GetStorage().write(XStorage.ID, res.data!.user!.id.toString());
    GetStorage().write(XStorage.PHONE, res.data!.user!.phoneNumber.toString());

    Get.offAllNamed(Routes.WRAPPER);
    return Future.value();
  }

  static Future<void> logout() async {
    GetStorage().remove(XStorage.TOKEN);
    GetStorage().remove(XStorage.NAME);
    GetStorage().remove(XStorage.ID);
    GetStorage().remove(XStorage.PHONE);

    Get.back();
    Get.offAllNamed(Routes.AUTH);

    return Future.value();
  }
}
