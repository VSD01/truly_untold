import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

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
                      webContactSection(context),
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
                      webContactSection(context),
                    ],
                  ),
                )
                    : Row(
                  children: [
                    Expanded(child: webContactSection(context)),
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
                    Expanded(child: webContactSection(context)),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

Widget webContactSection(context) {
  return Container(
    alignment: Alignment.center,
    height: Get.height,
    width: Get.width,
    color: Colors.white.withOpacity(0.8),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30),
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
        return

          Container(
          height: 100,
alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff891316), Color(0xff120203)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            shape: BoxShape.circle
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              servicesSlot1[index],style: AppTextStyle.white_14_700,
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context,int index){
        return SizedBox(
          height: 20,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
        );
      }, itemCount: servicesSlot1.length)
    ),
  );
}

List<String> servicesSlot1=[
  'Film Making',
  'Editing',
  'Motion Graphics',
  'Logo Making',
];
