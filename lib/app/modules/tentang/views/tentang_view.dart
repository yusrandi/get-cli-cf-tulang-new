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
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: doctorView(),
      ),
    );
  }

  doctorView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Text("Profil Dokter", style: CoreStyles.uTitle),
        Lottie.asset(CoreImages.homeDoctorJson, width: 150),
        Text("dr. Gerry Dwi Putri Sp. OT", style: CoreStyles.uSubTitle),
        Text("+62 853-4272-7058", style: CoreStyles.uSubTitle),
        Text(
            "Jln. Perintis Kemerdekaan Km. 11 Tamalandrea Jaya \n(RSUP Wahidin Sudirohusodo) Kec. Tamalandrea,\nKota Makassar",
            style: CoreStyles.uContent,
            textAlign: TextAlign.center),
      ],
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
                  Lottie.asset(CoreImages.homeDoctorJson, width: 50),
                  Expanded(
                    child: Column(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home_filled, size: 15),
                            SizedBox(width: 8),
                            Text(user.address!,
                                style: CoreStyles.uSubTitle.copyWith(
                                    color: CoreColor.kTextColor, fontSize: 10),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ],
                    ),
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
