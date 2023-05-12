import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/footer/footer_view.dart';

class BlogDetailsWidget extends StatelessWidget {
  const BlogDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.pink, Colors.black, Colors.blue];
    return GetBuilder<BlogDetailsController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding:  Responsive.isMobile(context) ||
                          Responsive.isTablet(context)
                          ?EdgeInsets.symmetric(horizontal: 20):EdgeInsets.symmetric(horizontal: 450),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Dimens.boxHeight5,
                          Text(
                            controller.title,
                            style:
                            Responsive.isMobile(context)||Responsive.isTablet(context)?
                                AppTextStyle.black_50_700:
                            AppTextStyle.black_80_700,

                            textAlign: TextAlign.center,
                          ),
                          Dimens.boxHeight5,
                          Container(
                            height: Get.height * 0.50,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(controller.coverImage))),
                          ),
                          Dimens.boxHeight5,
                          Text(
                            controller.date,
                            style: AppTextStyle.black_12_400,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            controller.subtitle,
                            style: AppTextStyle.grey_17_400,

                          ),
                          Dimens.boxHeight5,
                          Dimens.boxHeight5,
                          Text(
                            controller.descriptionPara1,
                            style: AppTextStyle.black_19_400,
                            textAlign: TextAlign.left,
                            softWrap: true,
                          ),
                          Dimens.boxHeight5,
                          Column(
                            children: [
                              Row(
                                children: [
                                  controller.image1.toString().isEmpty
                                      ? Container()
                                      : Expanded(
                                          child:
                                          Image.network(controller.image1,height: Get.height*0.40,),

                                        ),
                                  Dimens.boxWidth10,
                                  controller.image2.toString().isEmpty
                                      ? Container()
                                      : Expanded(
                                          child:
                                          Image.network(controller.image2,height: Get.height*0.40,),
                                          // Container(
                                          //   height: Get.height * 0.20,
                                          //   decoration: BoxDecoration(
                                          //       color: Colors.grey,
                                          //       image: DecorationImage(
                                          //           fit: BoxFit.cover,
                                          //           image: NetworkImage(
                                          //               controller.image2))),
                                          // ),
                                        ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              controller.image3.toString().isEmpty
                                  ? Container()
                                  :
                              Image.network(controller.image3,height: Get.height*0.40,),
                              // Container(
                              //
                              //         decoration: BoxDecoration(
                              //             color: Colors.grey,
                              //             image: DecorationImage(
                              //                 fit: BoxFit.cover,
                              //                 image:
                              //                     NetworkImage(controller.image3))),
                              //       ),
                            ],
                          ),
                          Dimens.boxHeight10,

                        ],
                      ),
                    ),
                    const FooterWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
