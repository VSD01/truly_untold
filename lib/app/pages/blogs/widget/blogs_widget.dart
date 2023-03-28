import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/theme/app_textstyles.dart';

class BlogsWidget extends StatelessWidget {
  const BlogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                
                padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?30: 200),
                color: Colors.black,
                child: Column(
                  children: [
                    Divider(color: Colors.grey,thickness: 1,),
                   
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('THE BLOG',style:AppTextStyle.veryLarge_700)),
                       Divider(color: Colors.grey,thickness: 1,),
                        SizedBox(height: Get.height*0.02,),
                    Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.height*0.50,
                              width: Get.width/2,
                              decoration: BoxDecoration(
                                
                                image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/_VSD8558.jpg'))
                              ),
                            ),
                            Text(
                              
                              'You Are Not Just Talented, You Are Spiritually Gifted',style:AppTextStyle.white_30_700),
                              SizedBox(height: Get.height*0.02,),
                            Text('And I am not that special for saying that. Most of us want to leave an imprint on the world that makes it better.'
                             'Sure, maybe our ambitions are vastly different. Some of us dream of influencing the WHOLE world while'
                              'some of us see OUR world as the people we aim to influence.',style: AppTextStyle.white_17_400,)
                          ],
                        )),
                        SizedBox(width: Get.width*0.03,),
                        Expanded(child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context,int index){
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                 height: Get.height*0.15,
                                 
                                 color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: Get.width*0.02,),
                              Expanded(
                                flex: 2,
                                child: Text('lorem ipsum and all things work fine dont take any tension about the things',style: AppTextStyle.white_30_700,))
                            ],
                          );
                        }, separatorBuilder: (BuildContext context,int index){
                          return SizedBox(height: Get.height*0.02,);
                        }, itemCount: 3))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}