import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilsonwings/home_screen/home_binding.dart';
import 'package:wilsonwings/home_screen/home_screen.dart';
import 'package:wilsonwings/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.textTheme,
      initialBinding: HomeBinding(),
      home: const HomeScreen(),
    );
  }
}
