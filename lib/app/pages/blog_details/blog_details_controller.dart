import 'package:get/get.dart';

class BlogDetailsController extends GetxController{


  var coverImage=Get.arguments['headImage'];
  var title=Get.arguments['title'];
  var subtitle=Get.arguments['subtitle'];
  var descriptionPara1=Get.arguments['articlePara1'];
  var descriptionPara2=Get.arguments['articlePara2'];
}