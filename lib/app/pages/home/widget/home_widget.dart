import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 850,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: NetworkImage(
                                "https://th.bing.com/th/id/R.c81ae7b371e44d77dfc7f5e822047ced?rik=QFGQxInWl6gosg&riu=http%3a%2f%2fcdn.mysitoo.com%2f10750%2fcache%2fatn1024_Poster+Two+Face+-+Tom+Levin+web.jpg%3fv%3d1414619492&ehk=s%2foAn%2b4SyMyk%2bCF0Sr6S7EVJv6mSMg10sgLXQdHGhvE%3d&risl=&pid=ImgRaw&r=0")))),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.dialog(
                                  
                                  Container(
                                  
                                  color: Colors.white.withOpacity(0.5),
                                ),);
                              },
                              child: Text(
                                'About',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              'Blog',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FadeTransition(
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
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          height: 300,
                          width: 500,
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  'सत्य को किसी प्रमाण की आवश्यकता नहीं होती, लेकिन अक्सर लोग इस पर विश्वास करने से डरते हैं और विश्वास करने से इंकार कर देते हैं।'
                                  'लेकिन कभी-कभी सच को साबित करना होता है, इसलिए चाहे जो भी हो, हम ट्रूली अनटोल्ड में आपका स्वागत करते हैं और दुनिया\n\n में हो रही किसी भी घटना और ऐसी ही कुछ कहानियों का सच सामने लाने की कोशिश करते हैं। हम उन कहानियों पर भी चर्चा करेंगे जो आपको दंग कर देंगी।'
                                  'अगर आप हमारी दुनिया के बारे में सुनना पसंद करते हैं तो हमारे चैनल को अभी सब्सक्राइब करें',
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  speed: Duration(milliseconds: 60),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 135,
                          width: 135,
                          child: Image.asset('assets/logo.png'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
