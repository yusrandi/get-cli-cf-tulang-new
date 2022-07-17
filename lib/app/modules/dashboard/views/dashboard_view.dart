import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/cores/core_strings.dart';
import 'package:getx_tulang_cf/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_images.dart';
import '../../../cores/core_styles.dart';
import '../../result/controllers/result_manager.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final ResultManager resultManager = Get.put(ResultManager());

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Stack body() {
    return Stack(
      children: [
        Positioned(
            top: 50,
            right: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.PROFILE),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/male-doctor.svg",
                      color: CoreColor.primary),
                  SizedBox(width: 16),
                  Text(CoreStrings.appName, style: CoreStyles.uTitle),
                ],
              ),
            )),
        Center(child: Lottie.asset(CoreImages.homeDoctorJson)),
        Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              children: [
                Text("history diagnosa terakhir",
                    style: TextStyle(color: CoreColor.primary, fontSize: 26),
                    textAlign: TextAlign.center),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            resultManager.getTulang() == null
                                ? '...'
                                : (resultManager.getTulang()! * 100)
                                        .round()
                                        .toString() +
                                    ' %',
                            style: TextStyle(
                                color: CoreColor.primary,
                                fontSize: 36,
                                fontWeight: FontWeight.bold)),
                        Text("Tingkat Keparahan Tulang",
                            style: TextStyle(
                                color: CoreColor.primary, fontSize: 12),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                            resultManager.getSendi() == null
                                ? '...'
                                : (resultManager.getSendi()! * 100)
                                        .round()
                                        .toString() +
                                    ' %',
                            style: TextStyle(
                                color: CoreColor.primary,
                                fontSize: 36,
                                fontWeight: FontWeight.bold)),
                        Text("Tingkat Keparahan Sendi",
                            style: TextStyle(
                                color: CoreColor.primary, fontSize: 12),
                            textAlign: TextAlign.center),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 100),
              ],
            ))
      ],
    );
  }

  Center tes() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Bell.svg",
                    color: CoreColor.primary),
                SizedBox(width: 16),
              ]),
          Text("14 April 2022",
              style: TextStyle(color: CoreColor.primary, fontSize: 16)),
          Lottie.asset(CoreImages.homeDoctorJson),
          SizedBox(height: 16),
          Text("28%",
              style: TextStyle(
                  color: CoreColor.primary,
                  fontSize: 66,
                  fontWeight: FontWeight.bold)),
          Text(
              "Diagnosa Terakhir Pada tanggal 14 April 2022 dengan penyakit Malarindu",
              style: TextStyle(color: CoreColor.primary, fontSize: 16),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
