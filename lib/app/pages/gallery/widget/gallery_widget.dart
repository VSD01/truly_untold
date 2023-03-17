import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

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
        child: SingleChildScrollView(
          child: Expanded(
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
                          color: Color(0xff0c1114),
                          height: Dimens.percentHeight(.50),
                          width: Get.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/side2.png',
                                  fit: BoxFit.cover,
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
                    Dimens.boxHeight10,
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        width: Get.width,
                        child: GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: imageList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 40,
                                    mainAxisSpacing: 40,
                                    crossAxisCount: 4,
                                    childAspectRatio: 3.2),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffcccccc),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(imageList[index])),
                                    borderRadius: BorderRadius.circular(20)),
                              );
                            })
                        // GridView.custom(
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   primary: false,
                        //   gridDelegate: SliverQuiltedGridDelegate(
                        //     crossAxisCount: 4,
                        //     mainAxisSpacing: 40,
                        //     crossAxisSpacing: 40,
                        //     repeatPattern: QuiltedGridRepeatPattern.inverted,
                        //     pattern: [
                        //       QuiltedGridTile(1, 2),
                        //       QuiltedGridTile(1, 1),
                        //       QuiltedGridTile(1, 1),
                        //       QuiltedGridTile(1, 2),
                        //     ],
                        //   ),
                        //   childrenDelegate: SliverChildBuilderDelegate(
                        //       (context, index) => Container(
                        //             alignment: Alignment.center,
                        //             decoration: BoxDecoration(
                        //                 color: Color(0xffcccccc),
                        //                 image: DecorationImage(
                        //                     fit: BoxFit.cover,
                        //                     image: AssetImage(imageList[index])),
                        //                 borderRadius: BorderRadius.circular(20)),
                        //           ),
                        //       childCount: imageList.length),
                        // ),
                        ),
                    Dimens.boxHeight10,
                  ],
                )),
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

List<String> imageList = [
  'assets/example/pexels-alfo-medeiros-13388273.jpg',
  'assets/example/pexels-dương-nhân-1510149.jpg',
  'assets/example/pexels-ismael-sánchez-2282000.jpg',
  'assets/example/pexels-jan-koetsier-2724373.jpg',
  'assets/example/pexels-magda-ehlers-613431.jpg',
  'assets/example/pexels-mikey-dabro-1002669.jpg',
  'assets/example/pexels-alfo-medeiros-13388273.jpg',
  'assets/example/pexels-dương-nhân-1510149.jpg',
  'assets/example/pexels-ismael-sánchez-2282000.jpg',
  'assets/example/pexels-jan-koetsier-2724373.jpg',
  'assets/example/pexels-magda-ehlers-613431.jpg',
  'assets/example/pexels-mikey-dabro-1002669.jpg',
];
