import 'package:flutter/material.dart';
import 'package:todo/login_screen.dart';
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
                child: Image.asset("assets/signup.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "¡Te damos la bienvenida a Tasky!",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Administra todos tus proyectos y tareas en un solo lugar.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ToDoButton(
                title: 'Login',
                link: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
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
        ),
      ),
    );
  }
}
