import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddVlogController extends GetxController{
  /// All coxntrollers here--------------------------
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();

  FocusNode  isFocused=FocusNode();


    void onFocusChange() {
    debugPrint("Focus: ${isFocused.hasFocus.toString()}");
    update();
  }

  

  @override
  void onInit() {
    super.onInit();
    isFocused.addListener(onFocusChange);
  }
}