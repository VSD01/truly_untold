import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class BlogDetailsWidget extends StatelessWidget {
  const BlogDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogDetailsController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child:GestureDetector(
               onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
               child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  
                    children: [
                      Dimens.boxHeight5,
                      Text(controller.title,style: AppTextStyle.black_20_700,),
                       Dimens.boxHeight5,
                      Container(
                        height: Get.height*0.20,
                        width: Get.width*0.20,
                      
                        decoration: BoxDecoration(
                            color: Colors.grey,
                          image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(controller.coverImage))),
                      ),
                       Dimens.boxHeight5,
                      Text(controller.subtitle,style: AppTextStyle.grey_17_400,),
                       Dimens.boxHeight5,

                        Dimens.boxHeight5,
                      Text(controller.description,style: AppTextStyle.black_17_400,),
                       Dimens.boxHeight5,
                    ],
                  ),
                ),
               ),
            ) ,
          ),
        );
      }
    );
  }
}