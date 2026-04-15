import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_navbar.dart';
import '../../home/views/home_view.dart';

class WrapperController extends GetxController {
  final pageIndex = 0.obs;
  String connectionStatus = 'Unknown';

  List<Widget> get currentPage {
    return [
      HomeView(),
      HomeView(),
      HomeView(),
    ];
  }

  List<BottomNavigationBarItem> get bottomMenuItem {
    return [
      BottomNavigationBarItem(
        label: 'Home',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 0,
          svg: 'home',
          svgActive: 'home-fill',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Transaction',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 1,
          svg: 'receipt',
          svgActive: 'receipt-fill',
        ),
      ),
      BottomNavigationBarItem(
        label: 'Profile',
        icon: BuildIconNavBar(
          currentTab: this.pageIndex.value,
          index: 2,
          svg: 'user',
          svgActive: 'user-fill',
        ),
      )
    ];
  }

  @override
  void onInit() async {
    super.onInit();
  }

  updateBottomNavbar() {
    update();
  }

  void onTapBottomNavbar(int index) async {
    this.pageIndex.value = index;
  }

  @override
  void onReady() async {
    super.onReady();
    print('================ Ready Wrapper ================');
  }

  @override
  void onClose() {
    super.dispose();
  }
}
