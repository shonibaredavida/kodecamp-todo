import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home_page_screen.dart';
import 'package:todo/screens/landing_page.dart';
import 'package:todo/utils/constants/colors.dart';

class LoginController extends GetxController {
  var email = '';
  var name = '';
  var showPass;
  var passChecker;
  var password = '';
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var inAgreement;

  @override
  void onInit() {
    super.onInit();
    inAgreement = false;
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    inAgreement = false.obs;
    showPass = false.obs;
    passChecker = false.obs;
  }

  void onBack() {
    emailController.text = "";
    nameController.text = "";
    passwordController.text = "";
  }

  void validateForm({context, key, username}) {
    if (key.currentState!.validate()) {
      //      print("n: $name e:  $email p: $password");
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                "   Login Successful ",
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      onCloseForm();
                      Get.to(HomePageScreen(username: username));
                    },
                    child: const Text("Go to Task App ")),
                TextButton(
                  onPressed: () {
                    onBack();
                    loginKey.currentState!.reset();
                    Get.offAll(const LandingPageScreen());
                  },
                  child: const Text(
                    "Go Back",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            );
          });
      key.currentState!.save();
    }
  }

  void checkAgreement(context) {
    if (inAgreement.value) {
      //  print(name + "newnam10101 byr");

      validateForm(
          context: context, key: loginKey, username: nameController.text);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Kindly Agree with the KTodo Conditions",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }

  void onCloseForm() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  String? validateName(String? value) {
    //  validateUsername(value);
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 10) {
      return "Must have more than 2 characters ";
    }

    //  print(nameController.text + "newnam10101");
    return null;
  }

  String? validateEmail(String? value) {
    /*  if (!GetUtils.isEmail(value!)) {
      return "Provide valid Email";
    } */
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.trim().length < 8) {
      return "Password Contain atleast 8 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginKey.currentState!.save();
  }
}
