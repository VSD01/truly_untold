import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/footer/footer_view.dart';
import 'package:practise1/app/theme/app_textstyles.dart';

class BlogsWidget extends StatelessWidget {
  const BlogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(builder: (controller) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: SingleChildScrollView(
            child: StreamBuilder<List<BlogsResponse>>(
                stream: controller.allBlogs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data!;
                    final finalList = [];
                    for (var i = 4; i < user.length; i++) {
                      finalList.add(user[i]);
                    }
                    if (user.isEmpty) {
                      return Container(
                        height: Get.height,
                        child: Center(
                          child: Text('No Blogs posted yet'),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Responsive.isMobile(context) ? 30 : 200),
                            color: Colors.black,
                            child: Column(
                              children: [
                                FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text('THE JOURNAL',
                                        style: AppTextStyle.veryLarge_700)),
                                const Divider(
                                  color: Colors.grey,
                                  height: 0,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                Responsive.isMobile(context) ||
                                        Responsive.isTablet(context)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// big blog screen============
                                          bigBlogScreen(user: user),
                                          SizedBox(
                                            width: Get.width * 0.03,
                                          ),

                                          /// Blog list=====================
                                          blogList(user: user),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// big blog screen============
                                          Expanded(
                                              child: bigBlogScreen(user: user)),
                                          SizedBox(
                                            width: Get.width * 0.03,
                                          ),

                                          /// Blog list=====================
                                          Expanded(child: blogList(user: user)),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Responsive.isMobile(context) ? 30 : 200),
                              width: Get.width,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: finalList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 40,
                                    mainAxisSpacing: 40,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        NavigateTo.blogDetailsScreen(
                                          headImage: user[0].coverImage,
                                          title: user[0].title,
                                          subtitle: user[0].subtitle,
                                          articlePara1:
                                              user[0].descriptionPara1,
                                          image1: user[0].image2,
                                          date: user[0].date,
                                          image2: user[0].image3,
                                          image3: user[0].image4,
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          OnHover(builder: ((isHovered) {
                                            return Stack(
                                              children: [
                                            CachedNetworkImage(


                                            imageUrl: finalList[index]
                                                .coverImage,


                                            ),

                                                isHovered
                                                    ? Container(
                                                        height:
                                                            Get.height * 0.28,
                                                        alignment:
                                                            Alignment.center,
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                        child: Chip(
                                                            label: Text(
                                                          'Explore',
                                                          style: AppTextStyle
                                                              .black_20_700,
                                                        )),
                                                      )
                                                    : SizedBox(),
                                              ],
                                            );
                                          })),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          Text(
                                            finalList[index].title,
                                            style: AppTextStyle.black_20_700,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          Text(
                                            finalList[index].date,
                                            style: AppTextStyle.black_12_400,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          Text(
                                            finalList[index].subtitle,
                                            style: AppTextStyle.grey_17_400,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          Dimens.boxHeight10,
                          FooterWidget(),
                        ],
                      );
                    }
                  } else {
                    return Container(
                        height: Get.height,
                        child:
                            Center(child: const CircularProgressIndicator()));
                  }
                }),
          ),
        ),
      );
    });
  }
}

Widget bigBlogScreen({required List user}) {
  return GetBuilder<BlogsController>(builder: (controller) {
    return GestureDetector(
      onTap: () {
        NavigateTo.blogDetailsScreen(
          headImage: user[0].coverImage,
          title: user[0].title,
          subtitle: user[0].subtitle,
          articlePara1: user[0].descriptionPara1,
          date: user[0].date,
          image1: user[0].image2,
          image2: user[0].image3,
          image3: user[0].image4,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OnHover(builder: ((isHovered) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: Get.height * 0.50,
                  child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.updateDots,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        List<String> bigContainerImages = [
                          user[0].coverImage,
                          user[0].image2,
                          user[0].image3,
                          user[0].image4,
                        ];
                        return CachedNetworkImage(


                          imageUrl: user[index].coverImage,


                        );
                      }),
                ),
                buildDots(),
                isHovered
                    ? Container(
                        alignment: Alignment.center,
                        height: Get.height * 0.50,
                        width: Get.width / 2,
                        color: Colors.white.withOpacity(0.9),
                        child: Chip(
                            label: Text(
                          'Explore',
                          style: AppTextStyle.black_20_700,
                        )),
                      )
                    : SizedBox(),
              ],
            );
          })),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(user[0].date, style: AppTextStyle.grey_12_400),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(user[0].title, style: AppTextStyle.white_30_700),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            user[0].subtitle,
            style: AppTextStyle.white_17_400,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
        ],
      ),
    );
  });
}

/// blog list widget here============================
Widget blogList({required List user}) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index.isGreaterThan(3)) return Container();
        if (index.isLowerThan(1)) return Container();
        return GestureDetector(
          onTap: () {
            NavigateTo.blogDetailsScreen(
              headImage: user[index].coverImage,
              title: user[index].title,
              subtitle: user[index].subtitle,
              articlePara1: user[index].descriptionPara1,
              image1: user[index].image2,
              date: user[0].date,
              image2: user[index].image3,
              image3: user[index].image4,
            );
          },
          child: Row(

            children: [
              Expanded(
                  flex: 1,
                  child: OnHover(
                    builder: (isHovered) {
                      return Stack(
                        children: [
                          CachedNetworkImage(
                            height: Get.height * 0.15,


                            imageUrl: user[index].coverImage,

                          ),

                          isHovered
                              ? Container(
                                  height: Get.height * 0.15,
                                  alignment: Alignment.center,
                                  color: Colors.white.withOpacity(0.9),
                                  child: Chip(
                                      label: Text(
                                    'Explore',
                                    style: AppTextStyle.black_20_700,
                                  )),
                                )
                              : SizedBox(),
                        ],
                      );
                    },
                  )),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        user[index].title,
                        style: AppTextStyle.white_30_700,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      user[index].subtitle,
                      style: AppTextStyle.white_14_700,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      user[index].date,
                      style: AppTextStyle.grey_12_400,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: Get.height * 0.02,
        );
      },
      itemCount: user.length);
}

/// Dot builder ///
Widget buildDots() {
  return GetBuilder<BlogsController>(builder: (controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: AnimatedContainer(
              width: controller.currentPage == index ? 25 : 10,
              curve: Curves.linear,
              height: 10,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
          );
        }),
      ),
    );
  });
}

/// Hover class ///

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const OnHover({Key? key, required this.builder}) : super(key: key);
  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -10, 0);
    final transform = isHovered ? hovered : Matrix4.identity();
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
