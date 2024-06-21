import 'package:flutter/material.dart';
import 'package:todo/home_page_screen.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/widgets/constants.dart';
import 'package:todo/widgets/todo_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  final formKey = GlobalKey<FormState>();
  bool inAgreement = false;
  final nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var name = "";
    var email = "";
    var password = "";
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Crear una cuenta",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "First Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.trim().length > 10) {
                          return "Must have more than 2 characters ";
                        }

                        //  print(nameController.text + "newnam10101");
                        return null;
                      },
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  const SizedBox(height: 15),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        //   print(emailController.text + "newnam10101");
                        return null; // Return null if the input is valid
                      },
                      decoration: InputDecoration(
                        //  label: const Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 8) {
                          return "Password Contain atleast 8 characters";
                        }
                        //  print(passwordController.text + "newnam10101");
                        return null;
                      },
                      obscureText: !showPass,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: showPass
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle),
                      Text(
                        " Should Contain atleast 8 characters.",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Aceptar Términos y condiciones   ",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Switch(
                          activeColor: primaryColor.withOpacity(0.6),
                          value: inAgreement,
                          onChanged: (val) {
                            setState(() {
                              inAgreement = val;
                            });
                          })
                    ],
                  ),
                  ToDoButton(
                    title: "Login to Task App",
                    link: () {
                      if (inAgreement) {
                        //  print(name + "newnam10101 byr");

                        validateForm(
                            context: context,
                            key: formKey,
                            username: nameController.text);
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
                        " © rezistrate con ",
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
                    height: 20,
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
                          height: 40,
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
                    height: 30,
                  ),
                  const Text(
                    "Already have an account? Login",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
      ),
    );
  }
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
              "   Login Successful",
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePageScreen(
<<<<<<< Updated upstream
                            //   username: username,
=======
                              username: username,
>>>>>>> Stashed changes
                            )));
                  },
                  child: const Text("Go to Task App ")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LandingPageScreen()));
                  },
                  child: const Text(
                    "Go Back",
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          );
        });
    key.currentState!.save();
  }
}
