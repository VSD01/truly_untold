import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class NavigateTo {

  static void menuPageScreen(){
    Get.toNamed(Routes.addVlog);
  }

  static void galleryScreen(){
    Get.toNamed(Routes.gallery);
  }
}
