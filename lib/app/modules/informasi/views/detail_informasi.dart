import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indent/indent.dart';

import '../../../cores/core_colors.dart';
import '../controllers/informasi_controller.dart';

class DetailInformasi extends StatelessWidget {
  final InformasiController informasiController = Get.find();

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoreColor.primary,
        centerTitle: false,
        title: Text(informasiController.listTitle[index]['title']),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${informasiController.listTitle[index]['subtitle']}'
                  .indent(10)),
            ),
            FutureBuilder<List<dynamic>>(
                future: informasiController.runFilter(index.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: CoreColor.primary,
                    );
                  }
                  print(snapshot.data);

                  return detailBody(snapshot.data!);
                }),
          ],
        ),
      ),
    );
  }

  detailBody(List<dynamic> data) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data[index]['detail']),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: data[index]['desc'].length,
              itemBuilder: (context, i) => Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${i + 1}. '),
                    SizedBox(width: 8),
                    Expanded(child: Text(data[index]['desc'][i])),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
