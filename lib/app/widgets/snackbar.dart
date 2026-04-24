import 'package:get/get.dart';

import '../themes/colors.dart';
import '../themes/themes.dart';

class XSnackbar {
  static void warning(
      {String title = 'Peringatan !', required String message}) {
    if (Get.isSnackbarOpen) Get.back();

    Get.snackbar(
      title,
      message,
      borderRadius: 6,
      backgroundColor: XColor.warning(),
      animationDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 4),
      boxShadows: XTheme.botShadow(),
    );
  }

  static void danger({String title = 'Gagal !', required String message}) {
    if (Get.isSnackbarOpen) Get.back();

    Get.snackbar(
      title,
      message,
      animationDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 4),
      colorText: XColor.netral1(),
      borderRadius: 6,
      backgroundColor: XColor.danger(),
      boxShadows: XTheme.botShadow(),
    );
  }

  static void success({String title = 'Berhasil !', required String message}) {
    if (Get.isSnackbarOpen) Get.back();

    Get.snackbar(
      title,
      message,
      animationDuration: Duration(milliseconds: 300),
      duration: Duration(seconds: 4),
      colorText: XColor.netral1(),
      borderRadius: 6,
      backgroundColor: XColor.success(),
      boxShadows: XTheme.botShadow(),
    );
  }
}
