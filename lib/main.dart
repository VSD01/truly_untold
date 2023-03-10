import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  } catch (e) {
    debugPrint(e.toString());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 745),
        builder: (BuildContext context, child) {
          return GetMaterialApp(
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            getPages: AppPages.pages,
            initialRoute: AppPages.initialRoute,
            enableLog: true,
          );
        });
  }
}



