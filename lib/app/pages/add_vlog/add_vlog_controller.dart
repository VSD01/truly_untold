


import 'dart:html';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddVlogController extends GetxController{
  /// All coxntrollers here--------------------------
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();

/// all variable here

  var image='';


  FocusNode  isFocused=FocusNode();


    void onFocusChange() {
    debugPrint("Focus: ${isFocused.hasFocus.toString()}");
    update();
  }

  ///upload cover image here----
String coverImageUrl='';
 uploadCoverImage() {
    var input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      print('loading-------------------');
     
        final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child(file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
      
          coverImageUrl = downloadUrl;
          print('imageurl---------$coverImageUrl');
        update();
      });
     
    });
   
  }

   ///upload image 1 here----
String ImageUrl2='';
 uploadImage2() {
    var input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child(file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
      
          ImageUrl2 = downloadUrl;
          print('imageurl---------$ImageUrl2');
        update();
      });
    });
   
  }

     ///upload image 3 here----
String ImageUrl3='';
 uploadImage3() {
    var input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child(file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
      
          ImageUrl3 = downloadUrl;
          print('imageurl---------$ImageUrl2');
        update();
      });
    });
   
  }

     ///upload image 4 here----
String ImageUrl4='';
 uploadImage4() {
    var input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child(file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
      
          ImageUrl4 = downloadUrl;
          print('imageurl---------$ImageUrl2');
        update();
      });
    });
   
  }





  Future saveBlog({required String title,required String description,})async{
   
  ///Reference to document
  final docUser=FirebaseFirestore.instance.collection('blogs').doc();
  final json={
    'title':title,
    'coverImage':coverImageUrl,
    'image2':ImageUrl2,
    'image3':ImageUrl3,
    'image4':ImageUrl4,
    'description':description,
  };

  ///create document and write dtaa to firebase
  await docUser.set(json);

}

// Future saveImage()async{
//   final path='files/creative-me';
//  // final file=File(pickedFile!.path!); 

//   final ref=  FirebaseStorage.instance.ref().child(path);
//   ref.putFile(file);
 
// }

  

  @override
  void onInit() {
    super.onInit();
    isFocused.addListener(onFocusChange);
  }
}