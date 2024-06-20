import 'package:flutter/material.dart';
import 'package:todo/home_page_screen.dart';
import 'package:todo/landing_page.dart';
import 'package:todo/widgets/constants.dart';
import 'package:todo/widgets/todo_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.trim().length > 10) {
                          return "Must have more than 2 characters ";
                        }
                        name = value;
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        email = value;
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
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 8) {
                          return "Password Contain atleast 8 characters";
                        }
                        password = value;
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
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
                      Switch(value: false, onChanged: (val) {})
                    ],
                  ),
                  ToDoButton(
                    title: "Login to Task App",
                    link: () {
                      validateForm(
                          context: context, key: formKey, username: name);
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
                            //   username: username,
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
  }
}
