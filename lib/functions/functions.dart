import 'package:flutter/material.dart';

void cancelNewTaskEntry(
    BuildContext context, TextEditingController controller) {
  controller.text = "";
  Navigator.pop(context);
}
