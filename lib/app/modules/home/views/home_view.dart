import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/modules/informasi/views/informasi_view.dart';
import 'package:getx_tulang_cf/app/modules/sendi/views/sendi_view.dart';

import '../../../cores/core_colors.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../auth/views/auth_view.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../konsultasi/views/konsultasi_view.dart';
import '../../tentang/views/tentang_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return _authManager.isLogged.value ? body() : AuthView();
    }));
  }

  Container body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: CoreColor.whiteSoft),
      child: Stack(
        children: [
          Obx((() => Container(
              child: controller.count.value == 0
                  ? DashboardView()
                  : controller.count.value == 1
                      ? InformasiView()
                      : controller.count.value == 2
                          ? SendiView()
                          : controller.count.value == 3
                              ? KonsultasiView()
                              : TentangView()))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child:
                          _listMenu("assets/icons/home-filled.svg", 0, "Home")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/bookmark-filled.svg", 1, "Tulang")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/bookmark-filled.svg", 2, "Sendi")),
                  Expanded(
                      flex: 1,
                      child:
                          _listMenu("assets/icons/forum.svg", 3, "Konsultasi")),
                  Expanded(
                      flex: 1,
                      child: _listMenu(
                          "assets/icons/male-doctor.svg", 4, "Dokter")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMenu(String title, int index, String menu) {
    return Obx((() => GestureDetector(
          onTap: () {
            controller.setIndex(index);
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: controller.count.value == index
                    ? CoreColor.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Center(
                    child: SvgPicture.asset(
                      title,
                      color: controller.count.value == index
                          ? Colors.white
                          : CoreColor.primary,
                      height: 30,
                    ),
                  ),
                ),
                Text(
                  menu,
                  style: TextStyle(
                      color: controller.count.value == index
                          ? Colors.white
                          : CoreColor.primary,
                      fontSize: 12),
                )
              ],
            ),
          ),
        )));
  }
}
