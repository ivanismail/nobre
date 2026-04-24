import '../../../export.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  Future initHome() async {
    if (!checkToken()) {
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
