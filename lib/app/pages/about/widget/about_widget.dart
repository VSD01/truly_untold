import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

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
                        webProfileSection(context,
                            image: 'assets/_VSD8558.jpg',
                            name: 'Vishal Singh Disodia',
                            description:
                                'Hi there my name is Vishal. Professionally I am a Film maker But here'
                                ' in ttu I and ankur both are doing something really different.'
                                ' We are just trying to dig out some unknown facts revolving around'
                                ' us that nobody knows. So definitely this site is just for you if you'
                                ' love to know more about your world. '),
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
                        webProfileSection(context,
                            image: 'assets/ankur profile.jpg',
                            name: 'Ankur Katiyar',
                            description:
                                'Hi, my name is Ankur and I am professionally 3D '
                                ' artist and recently we just started ttu. I and Vishal both are'
                                ' just working on this project. Where we are discussing some'
                                ' mind-blowing stories and activity of the world. Let\'s go join us in this journey !'),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                          child: webProfileSection(context,
                              image: 'assets/_VSD8558.jpg',
                              name: 'Vishal Singh Disodia',
                              description:
                                  'Hi there my name is Vishal. Professionally I am a Film maker But '
                                  'here in ttu I and ankur both are doing something really different.'
                                  ' We are just trying to dig out some unknown facts revolving around'
                                  ' us that nobody knows. So definitely this site is just for you if you'
                                  ' love to know more about your world. ')),
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
                      Expanded(
                          child: webProfileSection(context,
                              image: 'assets/ankur profile.jpg',
                              name: 'Ankur Katiyar',
                              description:
                                  'Hi, my name is Ankur and I am professionally 3D '
                                  ' artist and recently we just started ttu. I and Vishal both are'
                                  ' just working on this project. Where we are discussing some'
                                  ' mind-blowing stories and activity of the world. Let\'s go join us in this journey !')),
                    ],
                  ),
          ),
        ),
      ));
    });
  }
}

Widget webProfileSection(
  context, {
  required String name,
  required String image,
  required String description,
}) {
  return Container(
    alignment: Alignment.center,
    height: Get.height,
    width: Get.width,
    //color: Color(0xffcccccc),
    color: Colors.white.withOpacity(0.8),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Founder',
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
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image)),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
            ),
            Dimens.boxHeight2,
            Text(
              name,
              style: AppTextStyle.black_20_700,
            ),
            Dimens.boxHeight2,
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyle.black_17_400,
            ),
          ],
        ),
      ),
    ),
  );
}
