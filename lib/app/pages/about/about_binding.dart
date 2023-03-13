import 'package:get/get.dart';
import 'package:practise1/app/pages/about/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AboutController(),
      fenix: true,
    );
  }
}
