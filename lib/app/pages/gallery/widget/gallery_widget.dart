import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    height: Get.height,
                    width: Get.width,
                    color: Colors.white.withOpacity(0.7),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              
                              height: Dimens.percentHeight(.65),
                              width: Get.width,
                            ),
                            Container(
                               color: Color(0xff0c1114),
                              height: Dimens.percentHeight(.50),
                              width: Get.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/side3.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                    
                                    
                                      child: Image.asset('assets/logo.png',height: Get.height*0.20,),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      'assets/side2.jpg',
                                      fit: BoxFit.cover,
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
                                      horizontal: Responsive.isMobile(context)
                                          ? 30
                                          : 200),
                                  child: profileAvatar()),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30, top: 30),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      controller.drawerPageKey.currentState!
                                          .openDrawer();
                                    },
                                    child: Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ));
    });
  }
}

Widget profileAvatar() {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/mine.png')),
        color: Colors.black,
        border: Border.all(color: Color(0xffcccccc), width: 5),
        shape: BoxShape.circle,
      ),
      height: Dimens.percentHeight(.30),
      width: Dimens.percentHeight(.30),
    ),
  );
}
