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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Bahij', // Set the default font family
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(fontFamily: 'Bahij'), // Apply 'Bahij' to bodyText1
          bodyMedium:
              TextStyle(fontFamily: 'Bahij'), // Apply 'Bahij' to bodyText2
          // Define other text styles if needed
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: Binding(),
      home: const HomeScreen(),
      locale: const Locale('ar'),
    );
  }
}
