import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/cores/core_styles.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:getx_tulang_cf/app/modules/auth/controllers/authentication_manager.dart';
import 'package:getx_tulang_cf/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_images.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final AuthenticationManager authenticationManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.whiteSoft,
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: FutureBuilder<UserModel>(
            future: controller.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              UserModel user = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text("Profil Anda", style: CoreStyles.uTitle),
                  Lottie.asset(CoreImages.homeDoctorJson, width: 150),
                  Text(user.name!, style: CoreStyles.uSubTitle),
                  Row(children: [
                    Icon(
                      Icons.mail_outline_outlined,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.email!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.phone_android,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.phone!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.lahir!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Icon(
                      Icons.work_outline_outlined,
                      size: 20,
                      color: CoreColor.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      user.pekerjaan!,
                      style: CoreStyles.uContent,
                    )
                  ]),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      authenticationManager.logOut();
                      Get.offAndToNamed(Routes.SPLASH);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CoreColor.primary,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: CoreStyles.uSubTitle
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
