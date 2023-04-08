import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
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
                                Divider(
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
                                    crossAxisCount: 4,
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
                                                Image(
                                                  image: NetworkImage(
                                                      finalList[index]
                                                          .coverImage),
                                                  height: Get.height * 0.20,
                                                  width: Get.width,
                                                  fit: BoxFit.cover,
                                                ),
                                                isHovered
                                                    ? Container(
                                                        height:
                                                            Get.height * 0.20,
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
                                            finalList[index].subtitle,
                                            style: AppTextStyle.grey_17_400,
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          Dimens.boxHeight10,
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
  return GestureDetector(
    onTap: () {
      NavigateTo.blogDetailsScreen(
        headImage: user[0].coverImage,
        title: user[0].title,
        subtitle: user[0].subtitle,
        articlePara1: user[0].descriptionPara1,
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
            children: [
              Container(
                height: Get.height * 0.50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user[0].coverImage))),
              ),
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
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
      ],
    ),
  );
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
              image2: user[index].image3,
              image3: user[index].image4,
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: OnHover(
                    builder: (isHovered) {
                      return Stack(
                        children: [
                          Container(
                            height: Get.height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(user[index].coverImage))),
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
                  child: Text(
                    user[index].title,
                    style: AppTextStyle.white_30_700,
                  ))
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
