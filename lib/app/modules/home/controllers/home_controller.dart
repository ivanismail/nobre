import 'package:nobre/app/core/services/booking_service.dart';
import 'package:nobre/app/models/booking/category_res_model.dart';

import '../../../core/api_response.dart';
import '../../../export.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  Future initHome() async {
    if (!checkToken()) {
      Get.offAllNamed(Routes.AUTH);
    }

    loadCategory();
  }

  //* LIST CATEGORY
  bool isLoadingCategory = false;
  CategoryResModel categoryResModel = CategoryResModel();
  List<DataCategory> listCategory = [];

  Future loadCategory() async {
    isLoadingCategory = true;
    listCategory.clear();
    update();

    ApiResponse apiResponse = await BookingService.getCategory();
    try {
      categoryResModel = CategoryResModel.fromJson(apiResponse.body);
      categoryResModel.data!
          .forEach((element) => this.listCategory.add(element));
    } catch (e) {}

    this.isLoadingCategory = false;
    update();
  }
}
