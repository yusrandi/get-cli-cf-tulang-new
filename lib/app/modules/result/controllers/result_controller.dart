import 'dart:math';

import 'package:get/get.dart';

import '../../../data/models/basis.dart';
import '../../../data/models/gejala.dart';
import '../../../data/models/penyakit.dart';
import '../../../data/services/basis_service.dart';
import '../../../data/services/gejala_service.dart';
import '../../../data/services/laporan_service.dart';
import '../../../data/services/penyakit_service.dart';
import '../../../routes/app_pages.dart';
import '../../auth/controllers/authentication_manager.dart';
import '../../diagnosa/controllers/diagnosa_controller.dart';

class ResultController extends GetxController {
  final count = 0.obs;
  final resultText = "".obs;
  final userText = "".obs;

  RxList<ResultModel> dataListResult = (List<ResultModel>.of([])).obs;
  final AuthenticationManager authenticationManager = Get.find();

  @override
  void onInit() async {
    super.onInit();

    // print(Get.arguments);

    // List<Gejala> gejalas = await getGejala();
    List<BasisModel> basis = await getBasis();
    List<Penyakit> penyakit = await getPenyakit();
    List<DiagnosaModel> userCf = Get.arguments;
    // print(penyakit);

    resultText.value = "";
    userText.value = "\n";

    List allResult = [];
    int penyakitIdOld = 0;

    userCf.where((e) => e.value != 0.0).forEach((eU) {
      userText.value += "${eU.gejalaKode} = ${eU.valueLabel} (${eU.value})\n";
    });
    penyakit.forEach((eP) {
      print('Penyakit ${eP.id}');
      resultText.value += "\nPenyakit ${eP.penyakitNama}";
      double cfOld = 0;
      double resultCF = 0;

      var listValue = [];

      userCf.where((e) => e.value != 0.0).forEach((eU) {
        print('User CF Value ${eU.value}');
        basis.forEach((eB) {
          if (eP.id == eB.penyakitId) {
            if (eU.id == eB.gejalaId) {
              print(' Gejala ID ${eB.gejalaId} bobot ${eB.bobot}');
              listValue.add(eU.value);
            }
          }
        });
      });

      print('Length ${listValue.length}');

      // get min value from user value cf

      double minValue = 0.0;
      if (listValue.isNotEmpty) {
        if (listValue.length > 1) {
          // print(
          //     'Min Value not empty penyakit ${eB.penyakitId} value  ${listValue.reduce((a, b) => a < b ? a : b)}');
          minValue = listValue.reduce((a, b) => a < b ? a : b);
        } else {
          // print(
          //     'Min Value penyakit ${eB.penyakitId} value  ${listValue[0]}');
          minValue = listValue[0];
        }
      }

      print('Min Value  ${minValue}');
      userCf.where((e) => e.value != 0.0).forEach((eU) {
        basis.forEach((eB) {
          if (eP.id == eB.penyakitId) {
            if (eU.id == eB.gejalaId) {
              double cfCombine =
                  roundDouble((double.parse(eB.bobot!) * minValue), 2);
              double cfGabungan =
                  roundDouble((cfOld + cfCombine * (1 - cfOld)), 2);
              resultText.value +=
                  "\nGejala ${eB.gejalaId} \nCf Pakar ${eB.bobot} * Cf User ${minValue}, CF Combine ${cfCombine}, CfOld ${cfOld}, CF Gabungan ${cfGabungan}";
              cfOld = cfGabungan;
              resultCF = cfGabungan;
            }
          }
        });
      });

      print('=========================================');
      allResult.add(resultCF);
      dataListResult.add(ResultModel(eP, resultCF));
      count.value += 1;

      resultText.value +=
          "\nResult $resultCF\n====================================\n";
    });
  }

  getListResult() {
    return dataListResult.sort(
      (a, b) => b.value.compareTo(a.value),
    );
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
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

  Future<List<Penyakit>> getPenyakit() async {
    return await PenyakitService().fetchPenyakit();
  }

  Future<List<BasisModel>> getBasis() async {
    return await BasisService().fetchBasis();
  }

  Future<String> storeResult(String penyakit_id, String cf) async {
    String result = await LaporanService()
        .laporanStore(penyakit_id, authenticationManager.getToken()!, cf);

    Get.offAndToNamed(Routes.HOME);

    return result;
  }
}

class ResultModel {
  Penyakit? penyakit;
  double value;
  ResultModel(this.penyakit, this.value);
}
