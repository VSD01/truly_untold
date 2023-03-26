import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddImageController>(
      builder: (controller) {
        return SafeArea(
          child: GestureDetector(
            onTap: ()=> FocusManager.instance.primaryFocus!.unfocus(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:Responsive.isMobile(context)? 30 : 200 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.uploadGalleryImage();
                      },
                      child: Container(
                        height: Get.height*0.5,
                        width: Get.width*0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child:controller.imageUrl.isEmpty?Icon(Icons.add_a_photo,color:Colors.grey ,):Container(
                                height: Get.height * 0.10,
                                width: Get.width * 0.05,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      controller.imageUrl,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                      ),
                    ),
              SizedBox(height: Get.height*0.05,),
                    /// Textfield here
                    TextFormField(
                      controller: controller.titleController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
                      ),
                    ),
                    SizedBox(height: Get.height*0.05,),
                    /// Textfield here
                    TextFormField(
                      controller: controller.descriptionController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                      
                      
                        hintText: 'Description',

                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}