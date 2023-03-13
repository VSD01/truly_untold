import 'package:get/get.dart';
import 'package:practise1/app/app.dart';

class AppPages {
  static String initialRoute = Routes.home;
  static Duration transitionDuration = const Duration(milliseconds: 700);

  static final pages = [
    GetPage<HomeScreen>(
      name: Routes.home,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AboutScreen>(
      name: Routes.about,
      transitionDuration: transitionDuration,
      page: AboutScreen.new,
      binding: AboutBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
