import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? 0
                      : 180,
            ),
            child: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.centerRight,
                            width: Get.width,
                            color: Color(0xffcccccc),
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  controller.drawerPageKey.currentState!
                                      .openDrawer();
                                },
                                child: Icon(Icons.cancel_rounded))),
                        webServicesSection(context),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            controller.drawerPageKey.currentState!.openDrawer();
                          },
                          child: Container(
                            height: Dimens.percentHeight(1.0),
                            color: Colors.transparent,
                          ),
                        ),
                        webServicesSection(context),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Expanded(child: webServicesSection(context)),
                      Dimens.boxWidth10,
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      Dimens.boxWidth10,
                      Expanded(child: webServicesSection(context)),
                    ],
                  ),
          ),
        ),
      ));
    });
  }
}

Widget webServicesSection(context) {
  return Container(
    alignment: Alignment.center,
    height: Get.height,
    width: Get.width,
    color: Colors.white.withOpacity(0.8),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact Us',
              style: AppTextStyle.black_20_700,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              height:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? Get.height * 0.30
                      : Dimens.fourty,
              width:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? Get.width * 0.60
                      : Dimens.fourty,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/colored_logo.jpg')),
                  border: Border.all(color: Colors.white)),
            ),
            Dimens.boxHeight5,
            Text(
              'Professional photographer',
              style: AppTextStyle.black_20_700,
              textAlign: TextAlign.center,
            ),
            Dimens.boxHeight5,
            Text(
              'thetrulyuntold@gmail.com',
              style: AppTextStyle.black_17_400,
            ),
            Dimens.boxHeight5,
            Text(
              '+91 8375988895',
              style: AppTextStyle.black_17_400,
            ),
            Dimens.boxHeight5,
          ],
        ),
      ),
    ),
  );
}
