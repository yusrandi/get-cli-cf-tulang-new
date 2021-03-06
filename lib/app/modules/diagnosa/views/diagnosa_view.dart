import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_styles.dart';
import '../../../data/models/gejala.dart';
import '../../../routes/app_pages.dart';
import '../controllers/diagnosa_controller.dart';

class DiagnosaView extends GetView<DiagnosaController> {
  final DiagnosaController diagnosaController = Get.put(DiagnosaController());
  final List dropdownItemList = [
    {'label': 'Pilih', 'value': 0.0},
    {'label': 'Tidak Diketahui/Tidak Dirasakan Secara Pasti ', 'value': 0.2},
    {'label': 'Mungkin', 'value': 0.4},
    {'label': 'Kemungkinan Besar', 'value': 0.6},
    {'label': 'Hampir Pasti', 'value': 0.8},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.whiteSoft,
      appBar: AppBar(
        title: Text('Form Konsultasi'),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder<List<Gejala>>(
                  future: diagnosaController.getGejala(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    // print(snapshot.data);
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        child: Center(
                          child: Text('DIagnosa Belum Tersedia'),
                        ),
                      );
                    }
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            'Silahkan Anda Menjawab Pertanyaan Sesuai Kondisi Gejala dan Ciri-ciri yang Anda Rasakan!',
                            style: CoreStyles.uSubTitle,
                          ),
                          SizedBox(height: 16),
                          listGejala(snapshot),
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 16),
              GestureDetector(
                onTap: (() {
                  Get.toNamed(Routes.RESULT,
                      arguments: diagnosaController.dataListResult.value);
                  print(
                      "DiagnosaView length ${diagnosaController.dataListResult.value[0].value}");
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
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
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
            "id : ${model.id.toString()}, value : ${model.value.toString()}");
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
    );
  }

  ListView listGejala(AsyncSnapshot<List<Gejala>> snapshot) {
    return ListView.separated(
      // crossAxisCount is the number of columns
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        Gejala g = snapshot.data![index];
        diagnosaController.dataListResult.value.add(DiagnosaModel(
            g.id!,
            dropdownItemList[0]['value'],
            g.gejalaNama!,
            dropdownItemList[0]['label'],
            g.gejalaKode!));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuItem(g, index + 1),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: dropdown(g, index),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
    );
  }

  menuItem(Gejala g, int index) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(8)),
        child: Container(
          child: Text("${g.gejalaNama!} (${g.gejalaKode})",
              style: CoreStyles.uSubTitle
                  .copyWith(color: Colors.black, fontSize: 16)),
        ),
      ),
    );
  }

  dropdown(Gejala g, int index) {
    return CoolDropdown(
      dropdownList: dropdownItemList,
      dropdownBD: resultBD,
      resultTS: resultTS,
      unselectedItemTS: resultTS,
      placeholderTS: placeholderTS,
      onChange: (e) {
        // print(e);
        diagnosaController.dataListResult.value[index] = DiagnosaModel(
            g.id!, e['value'], g.gejalaNama!, e['label'], g.gejalaKode!);
      },
      defaultValue: dropdownItemList[0],
      // placeholder: 'insert...',
    );
  }

  final BoxDecoration resultBD = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(0, 1),
      ),
    ],
  );
  final TextStyle resultTS = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  final TextStyle placeholderTS =
      TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 14);
}
