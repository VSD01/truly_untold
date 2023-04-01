import 'package:get/get.dart';
import 'package:practise1/app/pages/blog_details/blog_details_controller.dart';

class BlogDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlogDetailsController(),fenix: true,);
  }
  
}