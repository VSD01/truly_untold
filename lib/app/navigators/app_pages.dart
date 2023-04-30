import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_binding.dart';
import 'package:practise1/app/pages/add_vlog/add_vlog_view.dart';
import 'package:practise1/app/pages/admin/admin_view.dart';
import 'package:practise1/app/pages/splash/splash_view.dart';

class AppPages {
  static String initialRoute = Routes.splash;
  static Duration transitionDuration = const Duration(milliseconds: 700);

  static final pages = [
    GetPage<SplashScreen>(
      name: Routes.splash,
      transitionDuration: const Duration(milliseconds: 300),
      page: SplashScreen.new,
      transition: Transition.fadeIn,
    ),
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
    GetPage<AddImageScreen>(
      name: Routes.addImage,
      transitionDuration: transitionDuration,
      page: AddImageScreen.new,
      binding: AddImageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BlogsScreen>(
      name: Routes.blogs,
      transitionDuration: transitionDuration,
      page: BlogsScreen.new,
      binding: BlogsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BlogDetailView>(
      name: Routes.blogsDetail,
      transitionDuration: transitionDuration,
      page: BlogDetailView.new,
      binding: BlogDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AdminScreen>(
      name: Routes.admin,
      transitionDuration: transitionDuration,
      page: AdminScreen.new,
      transition: Transition.fadeIn,
    ),
  ];
}
