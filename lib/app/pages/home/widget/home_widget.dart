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
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 30 : 200),
            child: Column(
              children: [
                Expanded(
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
                                fontSize: Dimens.fifteen,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 50),
                          ),
                          Text(
                            'UNTOLD',
                            style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontSize: Dimens.fifteen,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/R.c81ae7b371e44d77dfc7f5e822047ced?rik=QFGQxInWl6gosg&riu=http%3a%2f%2fcdn.mysitoo.com%2f10750%2fcache%2fatn1024_Poster+Two+Face+-+Tom+Levin+web.jpg%3fv%3d1414619492&ehk=s%2foAn%2b4SyMyk%2bCF0Sr6S7EVJv6mSMg10sgLXQdHGhvE%3d&risl=&pid=ImgRaw&r=0")))),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: Dimens.percentWidth(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Dimens.getWidthPercent(0.3),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    'सत्य को किसी प्रमाण की आवश्यकता नहीं होती, लेकिन अक्सर लोग इस पर विश्वास करने से डरते हैं और विश्वास करने से इंकार कर देते हैं।'
                                    'लेकिन कभी-कभी सच को साबित करना होता है, इसलिए चाहे जो भी हो, हम ट्रूली अनटोल्ड में आपका स्वागत करते हैं और दुनिया\n\n में हो रही किसी भी घटना और ऐसी ही कुछ कहानियों का सच सामने लाने की कोशिश करते हैं। हम उन कहानियों पर भी चर्चा करेंगे जो आपको दंग कर देंगी।'
                                    'अगर आप हमारी दुनिया के बारे में सुनना पसंद करते हैं तो हमारे चैनल को अभी सब्सक्राइब करें',
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimens.three,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    speed: Duration(milliseconds: 60),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                          Container(
                            height: 135,
                            width: 135,
                            child: Image.asset('assets/logo.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
