import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/data/services/auth_service.dart';
import 'package:getx_tulang_cf/app/modules/auth/controllers/cache_manager.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user_service.dart';

enum Status { none, running, stopped, paused }

class AuthController extends GetxController with CacheManager {
  final count = 0.obs;
  Rx<Status> status = Status.none.obs;
  RxBool passwordVisible = false.obs;
  RxString selectedDate = 'Tanggal Lahir'.obs;

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

  Future<String> userDaftar(UserModel user, String pass) async {
    print('lahir ${selectedDate.value}');
    status.value = Status.running;

    var haha = await UserService().userRegis(
        UserModel(
            id: 0,
            name: user.name,
            address: user.address,
            phone: user.phone,
            email: user.email,
            lahir: selectedDate.value,
            pekerjaan: user.pekerjaan),
        pass);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, "$haha",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));
    print(haha);

    return haha;
  }
}
