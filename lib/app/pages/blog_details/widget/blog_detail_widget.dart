import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/footer/footer_view.dart';

class BlogDetailsWidget extends StatelessWidget {
  const BlogDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors=[Colors.red,Colors.pink,Colors.black,Colors.blue];
    return GetBuilder<BlogDetailsController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child:GestureDetector(
               onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
               child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: Responsive.isMobile(context)||Responsive.isTablet(context) ?Get.width:Get.width/3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Dimens.boxHeight5,
                        Text(controller.title,style: AppTextStyle.black_80_700,maxLines: 2,textAlign: TextAlign.center,),
                         Dimens.boxHeight5,
                        Container(
                          height: Get.height*0.50,
                          width: Get.width,
                       
                          decoration: BoxDecoration(
                            
                              color: Colors.transparent,
                            image: DecorationImage(fit: BoxFit.contain,image: NetworkImage(controller.coverImage))),
                        ),
                         Dimens.boxHeight5,
                        Text(controller.date,style: AppTextStyle.black_12_400,),
                         Dimens.boxHeight5,
                        Text(controller.subtitle,style: AppTextStyle.grey_17_400,),
                         Dimens.boxHeight5,
                  
                          Dimens.boxHeight5,
                        Text(controller.result,style: AppTextStyle.black_19_400,textAlign: TextAlign.left,softWrap: true, ),
                         Dimens.boxHeight5,
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                    height: Get.height*0.20,                    
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                      image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(controller.image1))),
                                                          ),
                                  ),
                        Dimens.boxWidth10,
                         Expanded(
                           child: Container(
                                height: Get.height*0.20,               
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                  image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(controller.image2))),
                                                 ),
                         ),
                                ],
                              ),
                              Dimens.boxHeight10,
                               Container(
                              height: Get.height*0.20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(controller.image3))),
                        ),
                            ],
                          ),
                       Dimens.boxHeight10,
                       const FooterWidget(),
                         
                      ],
                    ),
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