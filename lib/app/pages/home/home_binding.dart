import 'package:get/instance_manager.dart';
import 'package:practise1/app/pages/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true,);
  }
}