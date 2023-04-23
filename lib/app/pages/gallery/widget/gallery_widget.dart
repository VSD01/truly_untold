import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flip_card/flip_card.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(builder: (controller) {
      return SafeArea(

          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: StreamBuilder<List<GalleryResponse>>(
              stream: controller.allImages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final imageData = snapshot.data!;
                  if (imageData.isEmpty) {
                    return SizedBox(
                      height: Get.height,
                      child: const Center(
                        child: Text('No Images in gallery yet'),
                      ),
                    );
                  } else {
                    return Container(
                        alignment: Alignment.centerRight,
                        color: Colors.white.withOpacity(0.8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
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
                                              Responsive.isMobile(context)
                                                  ? 30
                                                  : 200),
                                      child: profileAvatar()),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 30, top: 30),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                          Get.find<HomeController>()
                                              .drawerPageKey
                                              .currentState!
                                              .openDrawer();
                                        },
                                        child: const Icon(
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
                                builder: (context, snapshot) {
                                  final imageData = snapshot.data!;

                                  return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Responsive.isMobile(context)
                                              ? 30
                                              : 200),
                                      width: Get.width,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: imageData.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing:
                                                  Responsive.isMobile(context) ||
                                                          Responsive.isTablet(
                                                              context)
                                                      ? 8
                                                      : 40,
                                              mainAxisSpacing:
                                                  Responsive.isMobile(context) ||
                                                          Responsive.isTablet(
                                                              context)
                                                      ? 120
                                                      : 8,
                                              crossAxisCount:
                                                  Responsive.isMobile(context) ||
                                                          Responsive.isTablet(context)
                                                      ? 2
                                                      : 4,
                                              childAspectRatio: 1 / 1.2),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                OnHover(builder: ((isHovered) {
                                                  return Stack(
                                                    children: [
                                                      imageData[index]
                                                              .imageUrl
                                                              .isNotEmpty
                                                          ? Image(
                                                              image: NetworkImage(
                                                                  imageData[
                                                                          index]
                                                                      .imageUrl),
                                                              height:
                                                                  Get.height *
                                                                      0.20,
                                                              width: Get.width,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Container(),
                                                      isHovered
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                Get.dialog(
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child:
                                                                        Scaffold(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      body:
                                                                          BackdropFilter(
                                                                        filter: ImageFilter.blur(
                                                                            sigmaX:
                                                                                15.0,
                                                                            sigmaY:
                                                                                15.0),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 100),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                imageData[index].imageUrl.isEmpty
                                                                                    ? Container()
                                                                                    : Image(
                                                                                        image: NetworkImage(imageData[index].imageUrl),
                                                                                        height: Get.height / 2,
                                                                                        width: Get.width / 2,
                                                                                      ),
                                                                                SizedBox(
                                                                                  height: Get.height * 0.005,
                                                                                ),
                                                                                imageData[index].title.isEmpty
                                                                                    ? Container()
                                                                                    : Text(
                                                                                        imageData[index].title.capitalizeFirst!.trim(),
                                                                                        style: Responsive.isMobile(context) || Responsive.isTablet(context) ? AppTextStyle.white_14_700 : AppTextStyle.white_17_700,
                                                                                      ),
                                                                                SizedBox(
                                                                                  height: Get.height * 0.005,
                                                                                ),
                                                                                imageData[index].description.isEmpty
                                                                                    ? Container()
                                                                                    : Text(
                                                                                        imageData[index].description.trim(),
                                                                                        style: Responsive.isMobile(context) || Responsive.isTablet(context) ? AppTextStyle.white_14_700 : AppTextStyle.white_17_400,
                                                                                      ),
                                                                                SizedBox(
                                                                                  height: Get.height * 0.03,
                                                                                ),
                                                                                GestureDetector(
                                                                                  onTap: () => Get.back(),
                                                                                  child: Container(
                                                                                    alignment: Alignment.center,
                                                                                    height: 50,
                                                                                    width: Get.width / 3,
                                                                                    decoration: BoxDecoration(
                                                                                      border: Border.all(color: Colors.white),
                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                    ),
                                                                                    child: Text(
                                                                                      'Close',
                                                                                      style: AppTextStyle.white_14_700,
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                height:
                                                                    Get.height *
                                                                        0.20,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.9),
                                                                child: Chip(
                                                                    label: Text(
                                                                  'Explore',
                                                                  style: AppTextStyle
                                                                      .black_20_700,
                                                                )),
                                                              ),
                                                            )
                                                          : SizedBox(),
                                                    ],
                                                  );
                                                })),
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                imageData[index].title.isEmpty
                                                    ? Container()
                                                    : Text(
                                                        imageData[index]
                                                            .title
                                                            .capitalizeFirst!
                                                            .trim(),
                                                        style: Responsive.isMobile(
                                                                    context) ||
                                                                Responsive
                                                                    .isTablet(
                                                                        context)
                                                            ? AppTextStyle
                                                                .black_14_700
                                                            : AppTextStyle
                                                                .black_17_700,
                                                      ),
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                imageData[index]
                                                        .description
                                                        .isEmpty
                                                    ? Container()
                                                    : Text(
                                                        imageData[index]
                                                            .description
                                                            .trim(),
                                                        style: Responsive.isMobile(
                                                                    context) ||
                                                                Responsive
                                                                    .isTablet(
                                                                        context)
                                                            ? AppTextStyle
                                                                .grey_12_400
                                                            : AppTextStyle
                                                                .grey_17_400,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ],
                                            );
                                          }));
                                }),
                            Dimens.boxHeight10,
                          ],
                        ));
                  }
                } else {
                  return Container(
                      height: Get.height,
                      child: Center(child: const CircularProgressIndicator()));
                }
              }),
        ),
      ));
    });
  }
}

Widget profileAvatar() {
  return GetBuilder<GalleryController>(builder: (controller) {
    return FlipCard(
        controller: controller.flipController,
        front: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Color(0xffcccccc), width: 5),
              shape: BoxShape.circle,
            ),
            height: Get.height * 0.20,
            width: Get.width * 0.05,
            child: Image.asset('assets/logo.png')),
        back: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff891316), Color(0xff120203)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              border: Border.all(color: Color(0xffcccccc), width: 5),
              shape: BoxShape.circle,
            ),
            height: Get.height * 0.20,
            width: Get.width * 0.05,
            child: Image.asset('assets/logo.png')));

    // Container(
    //     decoration: BoxDecoration(
    //       color: Colors.black,
    //       border: Border.all(color: Color(0xffcccccc), width: 5),
    //       shape: BoxShape.circle,
    //     ),
    //     height: Get.height * 0.20,
    //     width: Get.width * 0.05,
    //     child: Image.asset('assets/logo.png'));
  });
}
