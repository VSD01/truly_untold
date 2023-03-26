import 'package:get/get.dart';
import 'package:practise1/app/pages/add_image/add_image_controller.dart';

class AddImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddImageController(),fenix: true,);
  }

}