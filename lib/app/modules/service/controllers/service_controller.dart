import 'package:get/get.dart';

class ServiceController extends GetxController {
  var selectedCategory = "Beard".obs;

  final categories = ["All", "Cut", "Color", "Beard"];

  final services = [
    {
      "name": "Beard",
      "duration": "25 min",
      "price": "17-30\$",
    },
    {
      "name": "Beard",
      "duration": "25 min",
      "price": "17-30\$",
    },
    {
      "name": "Beard",
      "duration": "25 min",
      "price": "17-30\$",
    },
    {
      "name": "Beard",
      "duration": "25 min",
      "price": "17-30\$",
    },
  ];

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}
