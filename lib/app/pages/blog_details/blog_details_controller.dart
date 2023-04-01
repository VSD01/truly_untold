import 'package:get/get.dart';

class BlogDetailsController extends GetxController{


  var coverImage=Get.arguments['headImage'];
  var title=Get.arguments['title'];
  var subtitle=Get.arguments['subtitle'];
  var description=Get.arguments['article'];
}