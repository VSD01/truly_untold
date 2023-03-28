import 'package:get/get.dart';
import 'package:practise1/app/pages/blogs/blogs_controller.dart';

class BlogsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlogsController(),fenix: true,);
  }
}