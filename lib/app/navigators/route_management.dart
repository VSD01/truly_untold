import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class NavigateTo {
  static void homePageScreen(){
    Get.toNamed(Routes.home);
  }

  static void menuPageScreen(){
    Get.toNamed(Routes.addVlog);
  }

  static void galleryScreen(){
    Get.toNamed(Routes.gallery);
  }

    static void addImageScreen(){
    Get.toNamed(Routes.addImage);
  }

    static void blogsScreen(){
    Get.toNamed(Routes.blogs);
  }

    static void blogDetailsScreen(
      {required String headImage,required String title,required String subtitle,required String article,}
    ){
    Get.toNamed(Routes.blogsDetail,arguments: {'headImage':headImage,'title':title,'subtitle':subtitle,'article':article,});
  }
}
