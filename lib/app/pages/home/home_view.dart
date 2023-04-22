import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/admin/admin_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        key: controller.drawerPageKey,
        drawer:
            Responsive.isMobile(context) ? mobileAppBarWidget() : Container(),
        appBar: AppBar(
          automaticallyImplyLeading:
              Responsive.isMobile(context) ? true : false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Responsive.isWeb(context) ? webAppBar() : Container(),
        ),
        backgroundColor: Colors.black,
        body: HomeWidget(),
      );
    });
  }
}

Widget webAppBar() {
  return GetBuilder<HomeController>(builder: (controller) {
    // print('ip adress-view part------------------------${controller.data} ---  ${controller.data=='{ip: 122.173.29.168}'}');
    return Row(
      children: [
        Spacer(),
        Row(
          children: [
            GestureDetector(onTap: () {
              Get.dialog(AboutScreen());
            }, child: OnHover(builder: ((isHovered) {
              return Text(
                'About',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              );
            }))),
            SizedBox(
              width: 100,
            ),
            GestureDetector(
              onTap: () {
                NavigateTo.galleryScreen();
              },
              child: OnHover(builder: ((isHovered) {
                return Text(
                'Gallery',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              );
              }))
            ),
            SizedBox(
              width: 100,
            ),
            GestureDetector(
              onTap: () {
                NavigateTo.blogsScreen();
              },
              child: OnHover(builder: ((isHovered) {
                return Text(
                'Blog',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              );
              }))
            ),
            SizedBox(
              width: 100,
            ),
            GestureDetector(
              onTap: () {
                Get.dialog(ContactScreen());
              },
              child: OnHover(builder: ((isHovered) {
                return Text(
                'Contact',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              );
              }))
            ),
           
          ],
        ),
        Spacer(),
      ],
    );
  });
}

Widget mobileAppBarWidget() {
  return GetBuilder<HomeController>(builder: (controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Drawer(
        width: Dimens.percentWidth(.40),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dimens.boxHeight20,
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset('assets/logo.png')),
            Dimens.boxHeight20,
            GestureDetector(
              onTap: () {
                Get.back();
                Get.dialog(AboutScreen());
              },
              child: Text(
                'About',
                style: AppTextStyle.black_17_700,
              ),
            ),
            Dimens.boxHeight15,
            GestureDetector(
              onTap: () {
                Get.back();
                Get.dialog(GalleryScreen());
              },
              child: GestureDetector(
                onTap: () {
                  NavigateTo.galleryScreen();
                },
                child: Text(
                  'Gallery',
                  style: AppTextStyle.black_17_700,
                ),
              ),
            ),
            Dimens.boxHeight15,
            GestureDetector(
              onTap: () {
                NavigateTo.menuPageScreen();
              },
              child: Text(
                'Blog',
                style: AppTextStyle.black_17_700,
              ),
            ),
            Dimens.boxHeight15,
            GestureDetector(
              onTap: () {
                Get.back();
                Get.dialog(ContactScreen());
              },
              child: Text(
                'Contact',
                style: AppTextStyle.black_17_700,
              ),
            ),
            controller.isIpmatched == true
                ? SizedBox(
                    width: 100,
                  )
                : Container(),
            controller.isIpmatched == true
                ? GestureDetector(
                    onTap: () {
                      Get.dialog(Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  NavigateTo.menuPageScreen();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Get.width * 0.70,
                                  height: Get.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey)),
                                  child: Text(
                                    'Add Blog',
                                    style: AppTextStyle.black_17_400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              GestureDetector(
                                onTap: () {
                                  NavigateTo.addImageScreen();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Get.width * 0.70,
                                  height: Get.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    'Add Image',
                                    style: AppTextStyle.white_17_400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    child: Text(
                      'Admin',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  });
}
