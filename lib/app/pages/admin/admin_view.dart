import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:practise1/app/navigators/route_management.dart';
import 'package:practise1/app/theme/app_textstyles.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      );
  }
}