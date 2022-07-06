import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_tulang_cf/app/cores/core_strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      title: CoreStrings.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
