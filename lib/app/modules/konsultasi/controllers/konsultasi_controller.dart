import 'package:get/get.dart';

import '../../../data/models/laporan_model.dart';
import '../../../data/services/laporan_service.dart';

class KonsultasiController extends GetxController {
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

  Future<List<LaporanModel>> getDataLaporan() async {
    return await LaporanService().fetchLaporan();
  }
}
