import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../diagnosa/controllers/diagnosa_controller.dart';
import '../controllers/result_controller.dart';
import '../controllers/result_manager.dart';

class ResultView extends GetView<ResultController> {
  final ResultController resultController = Get.put(ResultController());
  final ResultManager resultManager = Get.put(ResultManager());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.whiteSoft,
      appBar: AppBar(
        title: Text('Hasil Diagnosa'),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Text(
              "Infromasi Hasil Diagnosa",
              style: CoreStyles.uSubTitle,
            ),
            // Container(
            //   child: Obx(() => Text(resultController.resultText.value)),
            // ),
            SizedBox(height: 16),
            Obx(
              () => listResultPenyakit(resultController.dataListResult),
            ),
          ],
        ),
      ),
    );
  }

  listResultPenyakit(List<ResultModel> list) {
    list.sort((a, b) => b.value.compareTo(a.value));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ListView.separated(
        //   // crossAxisCount is the number of columns
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   scrollDirection: Axis.vertical,
        //   itemCount: list.length,
        //   itemBuilder: (context, index) {
        //     ResultModel model = list[index];
        //     return menuItem(model);
        //   },
        //   separatorBuilder: (context, index) => SizedBox(height: 8),
        // ),

        list.isNotEmpty ? kesimpulan(list) : Container(),
      ],
    );
  }

  kesimpulan(List<ResultModel> list) {
    var keterangan = 'Ringan';
    var hasil = (list[0].value * 100).round();
    if (hasil < 51) {
      keterangan = 'Ringan';
    } else if (hasil > 50 && hasil < 70) {
      keterangan = 'Sedang';
    } else {
      keterangan = 'Berat';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.all(16),
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: CoreColor.kHintTextColor,
                    strokeWidth: 10,
                    value: list[0].value,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(CoreColor.primary),
                  ),
                ),
                Center(
                  child: Text(
                    (list[0].value * 100).round().toString() + " %",
                    style: TextStyle(color: CoreColor.primary, fontSize: 24),
                  ),
                ),
              ],
            )),
        SizedBox(height: 16),
        Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text:
                        'Berdasarkan hasil konsultasi yang telah anda lakukan, maka anda mengalami penyakit ',
                    style: TextStyle(color: CoreColor.kTextColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: list[0].penyakit!.status == "PT"
                            ? 'Penyakit Tulang'
                            : 'Penyakit Sendi',
                        style:
                            TextStyle(color: CoreColor.primary, fontSize: 18),
                      ),
                      TextSpan(
                        text: ' dengan jenis penyakit ',
                        style: TextStyle(
                            color: CoreColor.kTextColor, fontSize: 18),
                      ),
                      TextSpan(
                        text: list[0].penyakit!.penyakitNama,
                        style:
                            TextStyle(color: CoreColor.primary, fontSize: 18),
                      ),
                      TextSpan(
                        text: ' dengan tingkat keparahan ',
                        style: TextStyle(
                            color: CoreColor.kTextColor, fontSize: 18),
                      ),
                      TextSpan(
                        text: (list[0].value * 100).round().toString() +
                            "% dinyatakan kategori $keterangan",
                        style:
                            TextStyle(color: CoreColor.primary, fontSize: 18),
                      )
                    ]),
              ),
            )),
        GestureDetector(
          onTap: (() {
            resultController.storeResult(
                list[0].penyakit!.id.toString(), list[0].value.toString());

            list[0].penyakit!.status == "PT"
                ? resultManager.saveTulang(tulang: list[0].value)
                : resultManager.saveSendi(sendi: list[0].value);
          }),
          child: Container(
            height: 60,
            margin: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: CoreColor.primary),
            child: Center(
                child: Text(
              'Selesai',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ],
    );
  }

  listResult(List<DiagnosaModel> list) {
    return ListView.separated(
      // crossAxisCount is the number of columns
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        DiagnosaModel model = list[index];
        return Text(
            "id : ${model.id.toString()}, value : ${model.value * model.id}");
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
    );
  }

  menuItem(ResultModel model) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.file_copy, color: CoreColor.kTextColor),
            ),
            Expanded(
                child: Container(
              child: Text(model.penyakit!.penyakitNama!,
                  style: CoreStyles.uSubTitle),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(16)),
              child: Text((model.value * 100).round().toString() + " %",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
