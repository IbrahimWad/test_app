import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Home/presentation/screens/home_screen.dart';
import 'package:test_app/core/helper/binding.dart';
import 'package:test_app/core/services/services_locator.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: Binding(),
      home: const HomeScreen(),
      locale: const Locale('ar'),
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
