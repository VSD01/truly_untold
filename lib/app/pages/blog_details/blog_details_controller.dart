import 'package:get/get.dart';

class BlogDetailsController extends GetxController{


  var coverImage=Get.arguments['headImage'];
  var title=Get.arguments['title'];
  var subtitle=Get.arguments['subtitle'];
  var descriptionPara1=Get.arguments['articlePara1'];
  var date=Get.arguments['date'];
  var image1=Get.arguments['image1'];
  var image2=Get.arguments['image2'];
  var image3=Get.arguments['image3'];

 
  String line = "";
String result = "";

void okay(){
   List<String> dividedPara=Get.arguments['articlePara1'].toString().split('.');
  for (int i = 0; i < dividedPara.length; i++) {
  if ((i + 1) % 80 == 0) {
    line += dividedPara[i] + "\n ";
    result += line;
    line = "";
  } else {
    line += dividedPara[i] + " ";
  }
}

if (line.isNotEmpty) {
  result += line;
}
update();

print(result);
}



@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
okay();
  }



}