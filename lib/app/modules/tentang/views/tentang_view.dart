import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/cores/core_colors.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_images.dart';
import '../../../cores/core_styles.dart';
import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  final tentangController = Get.put(TentangController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text("List Dokter", style: CoreStyles.uTitle),
          listUser(),
        ],
      ),
    );
  }

  listUser() {
    return FutureBuilder<List<UserModel>>(
        future: tentangController.usersResult(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          print(snapshot.data);
          List<UserModel> users =
              snapshot.data!.where((element) => element.roleId == 2).toList();
          if (users.isEmpty) {
            return Container(
              child: Center(
                child: Text('User Belum Tersedia'),
              ),
            );
          }
          return Container(
              child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: users.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final user = users[index];
              return Row(
                children: [
                  Lottie.asset(CoreImages.homeDoctorJson, width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name!,
                          style: CoreStyles.uSubTitle
                              .copyWith(color: Colors.black, fontSize: 16)),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 15),
                          SizedBox(width: 8),
                          Text(user.phone!,
                              style: CoreStyles.uSubTitle.copyWith(
                                  color: CoreColor.primary, fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.home_filled, size: 15),
                          SizedBox(width: 8),
                          Text(user.address!,
                              style: CoreStyles.uSubTitle.copyWith(
                                  color: CoreColor.kTextColor, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ));
        });
  }
}
