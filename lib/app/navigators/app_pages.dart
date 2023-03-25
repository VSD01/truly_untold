import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_binding.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_view.dart';

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

    GetPage<AddVlog>(
      name: Routes.addVlog,
      transitionDuration: transitionDuration,
      page: AddVlog.new,
      binding: AddVlogBinding(),
      transition: Transition.fadeIn,
    ),

     GetPage<GalleryScreen>(
      name: Routes.gallery,
      transitionDuration: transitionDuration,
      page: GalleryScreen.new,
      binding: GalleryBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
