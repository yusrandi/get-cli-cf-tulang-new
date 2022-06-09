import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:getx_tulang_cf/app/data/services/user_service.dart';

class TentangController extends GetxController {
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
  void onClose() {}
  void increment() => count.value++;

  Future<List<UserModel>> usersResult() async {
    return await UserService().fetchUsers();
  }
}
