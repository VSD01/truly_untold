import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_controller.dart';


class AddVlogWidget extends StatelessWidget {
  const AddVlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVlogController>(
      builder: (controller) {
        return SafeArea(child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
            
            },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 30 : 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.titleController,
                  decoration:const InputDecoration(
                    hintText: 'Title...',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,  
                  ),
                ), 

                
                    Container(
                    decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
                    ),
                  height: 50,
                    width: 50,
                    child: Icon(Icons.add,color: Colors.white,),
                  ),


                 TextFormField(
                  controller: controller.descriptionController,
                  focusNode: controller.isFocused,
                  decoration:const InputDecoration(
                    hintText: 'Start writing here...',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
//  controller.isFocused.hasFocus==false?
//                 GestureDetector(
//                   onTap: (){
//         // Get.bottomSheet(BottomSheet(onClosing: (){}, builder:(BuildContext context){
//         //   return Container(
//         //     color: Colors.red,
//         //     child: GridView.builder(
//         //       itemCount: 4,
//         //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //       crossAxisCount: 2,
//         //       childAspectRatio: Get.width/
//         //       (Get.height / 4),
//         //       crossAxisSpacing: 10,
//         //       mainAxisSpacing: 10

//         //     ), itemBuilder: (BuildContext context,int index){
//         //       return Container(color: Colors.black,);
//         //     }),
//         //   );
//         // }));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(10)
//                     ),
//                   height: 50,
//                     width: 50,
//                     child: Icon(Icons.add,color: Colors.white,),
//                   ),
//                 ):Container(),
              ],
            ),
          ),
        ),);
      }
    );
  }
}