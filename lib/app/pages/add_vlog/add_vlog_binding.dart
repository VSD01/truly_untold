import 'package:get/get.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_controller.dart';

class AddVlogBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddVlogController(),fenix: true,);
  }

}