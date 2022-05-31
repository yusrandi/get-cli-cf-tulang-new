import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../../data/models/laporan_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  final KonsultasiController konsultasiController =
      Get.put(KonsultasiController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text("History Diagnosa", style: CoreStyles.uTitle),
                FutureBuilder<List<LaporanModel>>(
                  future: konsultasiController.getDataLaporan(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<LaporanModel> data = snapshot.data!;
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            LaporanModel model = data[index];

                            return Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(bottom: 8, top: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.circle,
                                            color: CoreColor.primary),
                                      ),
                                      Container(
                                        width: 3,
                                        height: 100,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Container(
                                    // height: getProportionateScreenHeight(130),
                                    margin: EdgeInsets.only(left: 5),
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(model.penyakit!.penyakitNama!,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 16),
                                        Text(model.tanggal!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Harap Melakukan Konsultasi Lebih Lanjut Kepada Dokter Ahli",
                                            style: TextStyle(
                                                color: CoreColor.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          margin: EdgeInsets.only(top: 8),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 26, vertical: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                              '${(double.parse(model.cf!) * 100).round()} %',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            );
                          }),
                    );
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 100,
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.DIAGNOSA);
            },
            backgroundColor: CoreColor.primary,
            child: Icon(Icons.add),
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: Container()),
      ],
    );
  }
}
