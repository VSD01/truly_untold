import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddImageController extends GetxController{


  ///all controllers here
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();

   ///upload cover image here----
String imageUrl='';
 uploadGalleryImage() {
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
      
          imageUrl = downloadUrl;
          print('imageurl---------$imageUrl');
        update();
      });
    });
   
  }


  //// Add data to gallery
  Future saveGallery({required String title,required String description,})async{
   
  ///Reference to document
  final docUser=FirebaseFirestore.instance.collection('gallery').doc();
  final json={
    'id':docUser.id,
    'date':DateTime.now(),
    'title':title,
    'imageUrl':imageUrl,
    'description':description,
  };

  ///create document and write dtaa to firebase
  await docUser.set(json);

}
}