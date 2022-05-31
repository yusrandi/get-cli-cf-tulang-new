import 'package:get/get.dart';

import '../controllers/diagnosa_controller.dart';

class DiagnosaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosaController>(
      () => DiagnosaController(),
    );
  }
}
