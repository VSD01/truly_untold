import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise1/app/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDORQ-H7XsrDlIZWKLdC7ZX9h0gnlDYBTE",
          projectId: "truly-untold-14663",
          storageBucket: "truly-untold-14663.appspot.com",
          messagingSenderId: "41956516836",
          appId: "1:41956516836:web:048f16a90bd167c5ad5df1"),
    );
    await Hive.initFlutter();
    await Hive.openBox('ttu');

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
            scrollBehavior: AppScrollBehavior(),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            getPages: AppPages.pages,
            initialRoute: AppPages.initialRoute,
          );
        });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
