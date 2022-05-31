import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:indent/indent.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sendi_controller.dart';

class SendiView extends GetView<SendiController> {
  final sendiController = Get.put(SendiController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("Infromasi Penyakit Sendi",
                style: TextStyle(
                    color: CoreColor.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(
                "     Penyakit sendi adalah rasa sakit pada bagian tubuh yang menghubungkan tulang dengan tulang dan menyebabkan pergerakan dan kualitas hidup penderitanya menjadi tergannggu serta kurangnya produktIFitas bagi penderita."
                    .indent(10),
                style: TextStyle(
                  color: CoreColor.kTextColor,
                  fontSize: 14,
                )),
            Obx(() => menuItem(3)),
            Obx(() => menuItem(4)),
            Obx(() => menuItem(5)),
            Obx(() => menuItem(6)),
            Obx(() => menuItem(7)),
            Obx(() => menuItem(8)),
            SizedBox(height: 100),
          ]),
    );
  }

  menuItem(int index) {
    return GestureDetector(
      onTap: (() => Get.toNamed(Routes.DETAIL, arguments: index)),
      child: Container(
        margin: EdgeInsets.only(bottom: 8, left: 16),
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.file_copy, color: CoreColor.kTextColor),
            ),
            Expanded(
                child: Container(
              child: Text(sendiController.listTitle[index]['title'],
                  style: CoreStyles.uSubTitle),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.chevron_right, color: CoreColor.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final Widget screen;
  Item(this.name, this.screen);
}
