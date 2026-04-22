import 'package:get/get.dart';

class ServiceController extends GetxController {
  var selectedCategory = "Beard".obs;

  final categories = ["All", "Cut", "Color", "Beard"];

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}
