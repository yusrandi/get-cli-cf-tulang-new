import 'package:get_storage/get_storage.dart';

mixin CacheResult {
  Future<bool> saveTulang({double? tulang = 0.0}) async {
    final box = GetStorage();
    await box.write(CacheResultKey.TULANG.toString(), tulang);
    return true;
  }

  Future<bool> saveSendi({double sendi = 0.0}) async {
    final box = GetStorage();
    await box.write(CacheResultKey.SENDI.toString(), sendi);
    return true;
  }

  double? getTulang() {
    final box = GetStorage();
    return box.read(CacheResultKey.TULANG.toString());
  }

  double? getSendi() {
    final box = GetStorage();
    return box.read(CacheResultKey.SENDI.toString());
  }
}

enum CacheResultKey { TULANG, SENDI }
