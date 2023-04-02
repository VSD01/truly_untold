import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return GetBuilder<GalleryController>(builder: (controller) {
      return SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.centerRight,
              color: Colors.white.withOpacity(0.8),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Dimens.percentHeight(.65),
                        width: Get.width,
                      ),
                      Container(
                        color: Colors.black,
                        height: Dimens.percentHeight(.50),
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/side new  ankur.jpg',
                                
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Image.asset(
                                  'assets/logo.png',
                                  height: Get.height * 0.20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                'assets/side new  vishal.jpg',

                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Responsive.isMobile(context) ? 30 : 200),
                            child: profileAvatar()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30, top: 30),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.find<HomeController>().drawerPageKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.cancel_rounded,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight10,
                  StreamBuilder<List<GalleryResponse>>(
                    stream: controller.allImages(),
                    builder:(context,snapshot){
                      final imageData=snapshot.data!;
                    
                    return Container(
                  
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Responsive.isMobile(context) ? 30 : 200),
                              width: Get.width,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: imageData.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 40,
                                    mainAxisSpacing:Responsive.isMobile(context)||Responsive.isTablet(context)?120: 4,
                                    crossAxisCount:Responsive.isMobile(context)||Responsive.isTablet(context)? 2:4,
                                    
               
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () { 
                                        // NavigateTo.blogDetailsScreen(
                                        //   headImage:
                                        //       finalList[index].coverImage,
                                        //   title: finalList[index].title,
                                        //   subtitle: finalList[index].subtitle,
                                        //   article: finalList[index].description,
                                        // );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                imageData[index].imageUrl),
                                            height: Get.height * 0.20,
                                            width: Get.width,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          Text(
                                            imageData[index].title,
                                            style: AppTextStyle.black_17_400,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          Text(
                                            imageData[index].description,
                                            style: AppTextStyle.grey_17_400,
                                          ),
                                        ],
                                      ),
                                    );
                                  }));
                  } ),
                  Dimens.boxHeight10,
                ],
              )),
        ),
      ));
    });
  }
}

Widget profileAvatar() {
  return GetBuilder<GalleryController>(
    builder: (controller) {
      return GestureDetector(
        onTap: (){
          // controller.vedioController.value.isPlaying
          //     ? controller.vedioController.pause()
          //     : controller.vedioController.play();
              controller.update();
        },
        child: Container(
           decoration: BoxDecoration(
          //   image: DecorationImage(image: AssetImage('assets/mine.png')),
             color: Colors.black,
             border: Border.all(color: Color(0xffcccccc), width: 5),
             shape: BoxShape.circle,
      
          ),
          //height: Dimens.percentHeight(.30),
         // width: Dimens.percentHeight(.30),
         height: Get.height*0.20,
         width: Get.width*0.05,
          child: 
          Image.asset('assets/logo.png')
          // ClipRRect(
          //  borderRadius: BorderRadius.circular(50),
          //  clipBehavior: Clip.hardEdge,
          //   child: VideoPlayer(controller.vedioController)),
        ),
      );
    }
  );
}


