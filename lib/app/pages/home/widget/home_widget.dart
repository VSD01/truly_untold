import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practise1/app/app.dart';

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
              Responsive.isMobile(context) || Responsive.isMobile(context)
                  ? Container()
                  : centerImageWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context) ? 30 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Responsive.isMobile(context)
                        ? Container()
                        : Expanded(
                            flex: 2,
                            child: Image.asset(
                              'assets/logo croped.png',
                              scale: 3,
                            ),
                          ),

                    ///Logo text here------
                    mainTitleWidget(),


                     Responsive.isMobile(context)||Responsive.isMobile(context)
                        ? Expanded(child: centerImageWidget()):Container(),
                         Responsive.isMobile(context)||Responsive.isMobile(context)
                        ?Container(): Spacer(

                        ),
                    ///Bio widget here---------
                    bioWidget(context),

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
  return Row(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://drive.google.com/uc?export=view&id=1bbkFj2Ogn_k1HErAiP2GuKi9pEkj4zfI")))),
      ),
      Expanded(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://drive.google.com/uc?export=view&id=1ULDGk7cCYhXIRMFXGCvjwTnkzfKjEFfy")))),
      ),
    ],
  );
}

////Bio widget for web
Widget bioWidget(BuildContext context) {
  return Container(
    width: Dimens.percentHeight(.50),
    child: Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText(
              'Let\'s bite into the horrible, unforgiving truth. Even if there is no'
                  ' legal necessity for proof of the fact, many people will not take it at '
                  'face value. Together, let\'s travel the globe in search of amusing and'
                  ' fascinating facts. If you wish to learn more about our universe,'
                  ' "THE TRULY UNTOLD," you should immediately subscribe to our channel.',

              textStyle: TextStyle(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 12 : 15,
                fontWeight: FontWeight.w500,
              ),
              speed: Duration(milliseconds: 60),
              textAlign: TextAlign.center),
        ],
      ),
    )
  );
}
