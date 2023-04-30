import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_controller.dart';

class AddVlogWidget extends StatelessWidget {
  const AddVlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVlogController>(builder: (controller) {
      return SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 30 : 200),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      pickImageWidget(
                          text: 'Cover',
                          widget: controller.coverImageUrl.isEmpty
                              ? Text(
                                  'Cover\n➕',
                                  textAlign: TextAlign.center,
                                )
                              : Container(
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.05,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.coverImageUrl,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                          onTap: () async {
                            controller.uploadCoverImage();
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      pickImageWidget(
                          text: 'Image 2',
                          widget: controller.ImageUrl2.isEmpty
                              ? Text(
                                  'Image 2\n➕',
                                  textAlign: TextAlign.center,
                                )
                              : Container(
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.05,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.ImageUrl2,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                          onTap: () async {
                            controller.uploadImage2();
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      pickImageWidget(
                          text: 'Image 3',
                          widget: controller.ImageUrl2.isEmpty
                              ? Text(
                                  'Image 3\n➕',
                                  textAlign: TextAlign.center,
                                )
                              : Container(
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.05,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.ImageUrl3,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                          onTap: () async {
                            controller.uploadImage3();
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      pickImageWidget(
                          text: 'Image 4 ',
                          widget: controller.ImageUrl4.isEmpty
                              ? Text(
                                  'Image 4\n➕',
                                  textAlign: TextAlign.center,
                                )
                              : Container(
                                  height: Get.height * 0.10,
                                  width: Get.width * 0.05,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.ImageUrl4,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                          onTap: () async {
                            controller.uploadImage4();
                          }),
                    ],
                  ),
                  TextFormField(
                    controller: controller.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title...',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5,
                    textInputAction: TextInputAction.next,
                    controller: controller.subtitleController,
                    decoration: const InputDecoration(
                      hintText: 'Subtitle...',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      maxLines: 50,
                      controller: controller.descriptionPara1Controller,
                      focusNode: controller.isFocused,
                      decoration: const InputDecoration(
                        hintText: 'Start writing here for para 1...',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget pickImageWidget({
  GestureTapCallback? onTap,
  required String text,
  Widget? widget,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        alignment: Alignment.center,
        height: Get.height * 0.10,
        width: Get.width * 0.05,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(15)),
        child: widget),
  );
}
