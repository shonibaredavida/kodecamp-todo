import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kodecamp Todo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: const Color.fromARGB(255, 191, 190, 190))),
      home: const SplashScreen(),
    );
  }
}
