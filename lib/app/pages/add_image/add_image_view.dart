
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddImageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
                backgroundColor: Colors.black,
                  actions:  [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){
                          final title=controller.titleController.text;
                          final description=controller.descriptionController.text;
                         controller.saveGallery(title:title,description:description, );
                         controller.titleController.clear();
                         controller.descriptionController.clear();
                         controller.imageUrl='';
                         NavigateTo.homePageScreen();
                        },
                        child: Icon(Icons.check,color: Colors.white,))),
                  ],
              ),
          body: AddImageWidget(),
        );
      }
    );
  }
}