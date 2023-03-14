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
                              height: Dimens.percentHeight(.50),
                              width: Get.width,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1503395200327-a2ebe1d907b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&w=1000&q=80',
                                fit: BoxFit.cover,
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
                                  child: Row(
                                    children: [
                                      profileAvatar(),
                                      Dimens.boxWidth15,
                                      profileAvatar(),
                                    ],
                                  )),
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
        color: Colors.red,
        border: Border.all(color: Color(0xffcccccc), width: 5),
        shape: BoxShape.circle,
      ),
      height: Dimens.percentHeight(.30),
      width: Dimens.percentHeight(.30),
    ),
  );
}
