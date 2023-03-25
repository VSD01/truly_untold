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
                        webProfileSection(context,image: 'assets/_VSD8558.jpg',name: 'Vishal Singh Disodia'),
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
                        webProfileSection(context,image: 'assets/ankur profile.jpg',name:'Ankur Katiyar'),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      Expanded(child: webProfileSection(context,image: 'assets/_VSD8558.jpg',name: 'Vishal Singh Disodia')),
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
                      Expanded(child: webProfileSection(context,image: 'assets/ankur profile.jpg',name:'Ankur Katiyar')),
                    ],
                  ),
          ),
        ),
      ));
    });
  }
}

Widget webProfileSection(context,{required String name,required String image,}) {
  return Container(
    alignment: Alignment.center,
    height: Get.height,
    width: Get.width,
    //color: Color(0xffcccccc),
    color: Colors.white.withOpacity(0.8),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 30 : 70),
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
                  fit: BoxFit.cover,
                  image: AssetImage(image)),
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
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
              'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
              ' when an unknown printer took a galley of type and scrambled it to make a type '
              ' specimen book. It has survived not only five centuries, but also the leap into '
              ' electronic typesetting, remaining essentially unchanged. It was popularised in '
              ' the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,'
              '  and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.,',
              textAlign: TextAlign.center,
              style: AppTextStyle.black_17_400,
            ),
          ],
        ),
      ),
    ),
  );
}
