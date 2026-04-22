import 'package:get/get.dart';

class OrderController extends GetxController {
  DateTime selectedDay = DateTime.now();

  var selectedTime = "".obs;

  final times = [
    "9:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
  ];

  void selectTime(String time) {
    selectedTime.value = time;
  }
}
