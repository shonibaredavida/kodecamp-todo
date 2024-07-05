import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/login_controller.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';
import 'package:todo/widgets/todo_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.loginKey,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Can we know you?",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  const Text(
                    "First Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      return controller.validateName(value);
                    },
                    maxLength: 10,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSaved: (value) {
                      controller.name = value!;
                    },
                  ),
                  const SizedBox(height: AppSizes.sm),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return controller.validateEmail(value);
                    },
                    decoration: InputDecoration(
                      //  label: const Text('Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSaved: (value) {
                      controller.email = value!;
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  TextFormField(
                      controller: controller.passwordController,
                      validator: (value) {
                        //  validatepassword(value);
                        return controller.validatePassword(value);
                      },
                      onChanged: (value) {
                        if (value.length > 7) {
                          controller.passChecker = true;
                        } else {
                          controller.passChecker = false;
                        }
                      },
                      obscureText: !controller.showPass.value,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              /*    setState(() {
                                showPass = !showPass;
                              }); */
                            },
                            child: controller.showPass.value
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  const SizedBox(
                    height: AppSizes.xs,
                  ),
                  GetX<LoginController>(builder: (controller) {
                    return Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: AppSizes.md,
                          color: controller.passChecker.value
                              ? Colors.green
                              : Colors.red,
                        ),
                        const Text(
                          " Should Contain atleast 8 characters.",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    );
                  }),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "I agree with KTodo conditions",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      GetX<LoginController>(builder: (controller) {
                        return Switch(
                            activeColor: primaryColor.withOpacity(0.6),
                            value: controller.inAgreement.value,
                            onChanged: (val) {
                              controller.inAgreement.value = val;
                            });
                      })
                    ],
                  ),
                  ToDoButton(
                    title: "Login to Task App",
                    link: () {
                      controller.checkAgreement(context);
                    },
                    horizontalPadding: 0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        " other Login channels ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.defaultSpace,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.grey, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/google.png",
                          height: 2 * AppSizes.defaultSpace,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSectionsSm,
                  ),
                  const Text(
                    "Google Login... coming soon",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
