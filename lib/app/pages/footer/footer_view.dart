import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:practise1/app/pages/blogs/widget/blogs_widget.dart';
import 'package:practise1/app/pages/footer/footer_helper.dart';

import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  launchURL() async {
    const url = 'https://flutter.io';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            scale: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(footerHelper.length, (index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: OnHover(builder: ((isHovered) {
                    return GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(footerHelper[index].Url));
                      },
                      child: Image.asset(
                        footerHelper[index].image,
                        height: Get.height * 0.05,
                      ),
                    );
                  })));
            }),
          ),
        ],
      ),
    );
  }
}
