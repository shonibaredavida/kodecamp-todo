import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/splash_screen_controller.dart';
import 'package:todo/utils/constants/images.dart';
import 'package:todo/utils/constants/sizes.dart';
import 'package:todo/utils/constants/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset(AppImages.splashImage),
            Image.asset(AppImages.splashPix),

            const Text(
              appName,
              style: TextStyle(
                  fontSize: 2 * AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsSm,
            )
          ],
        ),
      ),
    );
  }
}
