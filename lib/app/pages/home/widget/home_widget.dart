import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/home/home.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // centerImageWidget(),
              Responsive.isMobile(context)
                  ? Container()
                  : Image.asset(
                      'assets/logo.png',
                      height: Dimens.twentyFive,
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:  Responsive.isMobile(context) ? 30 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Logo text here------
                    mainTitleWidget(),
              
                    ////Center image widget here------
                    centerImageWidget(),
              
                    ///Bio widget here---------
                    bioWidget(context),
                    Dimens.boxHeight10,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

///Logo text here
Widget mainTitleWidget() {
  return GetBuilder<HomeController>(builder: (controller) {
    return FittedBox(
      child: FadeTransition(
        opacity: controller.animation!,
        child: Opacity(
          opacity: 0.5,
          child: Column(
            children: [
              Text(
                'TRULY',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 50),
              ),
              Text(
                'UNTOLD',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 50),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

///Center image widget here
Widget centerImageWidget() {
  return Expanded(
    child: Expanded(
     
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/vishal_front.jpg")))),
    ),
  );
}

////Bio widget for web
Widget bioWidget(BuildContext context) {
  return Expanded(
    child: Container(
      width: Dimens.percentHeight(.50),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText(
              'सत्य को किसी प्रमाण की आवश्यकता नहीं होती, लेकिन अक्सर लोग इस पर विश्वास करने से डरते हैं और विश्वास करने से इंकार कर देते हैं।'
              'लेकिन कभी-कभी सच को साबित करना होता है, इसलिए चाहे जो भी हो, हम ट्रूली अनटोल्ड में आपका स्वागत करते हैं और दुनिया\n\n में हो रही किसी भी घटना और ऐसी ही कुछ कहानियों का सच सामने लाने की कोशिश करते हैं। हम उन कहानियों पर भी चर्चा करेंगे जो आपको दंग कर देंगी।'
              'अगर आप हमारी दुनिया के बारे में सुनना पसंद करते हैं तो हमारे चैनल को अभी सब्सक्राइब करें',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 12 : 17,
                fontWeight: FontWeight.w500,
              ),
              speed: Duration(milliseconds: 60),
              textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
