import 'package:get/get.dart';

import 'cache_result.dart';

class ResultManager extends GetxController with CacheResult {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void insertTulang(double tulang) async {
    await saveTulang(tulang: tulang);
  }

  void insertSendi(double sendi) async {
    await saveSendi(sendi: sendi);
  }
}
