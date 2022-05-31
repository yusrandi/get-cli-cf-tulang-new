import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/data/services/auth_service.dart';
import 'package:getx_tulang_cf/app/modules/auth/controllers/cache_manager.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';

enum Status { none, running, stopped, paused }

class AuthController extends GetxController with CacheManager {
  final count = 0.obs;
  Rx<Status> status = Status.none.obs;
  RxBool passwordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<String> loginUser(String phone, String password) async {
    status.value = Status.running;
    var _response = await AuthService().loginUser(phone, password);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, "$_response",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));

    return _response;
  }
}
