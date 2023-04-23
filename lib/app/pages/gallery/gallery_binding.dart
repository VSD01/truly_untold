import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class GalleryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryController(),fenix: true,);

    Get.lazyPut(() => HomeController(),fenix: true);
  }



}