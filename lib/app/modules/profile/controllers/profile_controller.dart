import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:getx_tulang_cf/app/data/services/user_service.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<UserModel> getUser() async {
    return await UserService().getUser();
  }
}
