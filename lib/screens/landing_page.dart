import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/login_screen.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/images.dart';
import 'package:todo/utils/constants/sizes.dart';
import 'package:todo/widgets/todo_button_widget.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(AppImages.loginPix),
              ),
              const SizedBox(
                height: AppSizes.mds,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Stay on track \nwith',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 3 * AppSizes.fontSizeMs,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                        text: ' KTodo',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 3 * AppSizes.fontSizeMs)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const Text(
                "Never forget uncompleted tasks ",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSectionsSm,
              ),
              ToDoButton(
                title: 'Login',
                link: () {
                  Get.to(const LoginScreen());
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSectionsSm,
              ),
              GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                          text: 'Login!',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizes.fontSizeMd)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
