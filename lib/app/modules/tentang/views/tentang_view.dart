import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'TentangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
