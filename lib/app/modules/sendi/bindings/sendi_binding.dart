import 'package:get/get.dart';

import '../controllers/sendi_controller.dart';

class SendiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendiController>(
      () => SendiController(),
    );
  }
}
