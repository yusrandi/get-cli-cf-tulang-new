import 'package:get/get.dart';

import '../../../data/models/gejala.dart';
import '../../../data/services/gejala_service.dart';

class DiagnosaController extends GetxController {
  final count = 0.obs;
  Rx<List<DiagnosaModel>> dataListResult = Rx<List<DiagnosaModel>>([]);

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

  Future<List<Gejala>> getGejala() async {
    return await GejalaService().fetchGejala();
  }

  Future<List<DiagnosaModel>> diagnosaResult() async {
    return await dataListResult.value;
  }
}

class DiagnosaModel {
  int id;
  double value;
  String gejalaLabel;
  String valueLabel;
  String gejalaKode;
  DiagnosaModel(
      this.id, this.value, this.gejalaLabel, this.valueLabel, this.gejalaKode);
}
