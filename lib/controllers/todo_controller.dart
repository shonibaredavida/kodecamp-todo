// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/home_page_screen.dart';

class TodoController extends GetxController {
  var todoList = <Todo>[].obs;
  var username;

  String textToSentenceCase(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  void toggleComplet(int taskIndex) {
    todoList[taskIndex].completed = !todoList[taskIndex].completed;
    todoList.refresh();
  }

  void showScreenDialog(Widget content, context) {
    Get.generalDialog(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: const Color.fromARGB(137, 200, 197, 197),
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder:
          (context, Animation animation, Animation secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black87.withOpacity(0.04),
          body: content,
        );
      },
    );
  }

  int getNumOfCompletedTask() {
    int count = 0;
    if (todoList.isEmpty) {
      return count = 0;
    }
    for (final eachList in todoList) {
      if (eachList.completed) {
        count++;
      }
    }
    return count;
  }

  addTask(TextEditingController descriptionController,
      TextEditingController titleController) {
    //   print(taskList.length);
    todoList.add(Todo(
      title: textToSentenceCase(titleController.text),
      desc: textToSentenceCase(descriptionController.text),
      completed: false,
      dateCreated: DateFormat('yMd').format(DateTime.now()),
    ));
    // print(" " + todoList.length.toString());

    Get.back();
    Get.off(() => HomePageScreen(username: username));
  }

  removeTask(index) {
    todoList.removeAt(index);
  }

  editTask(TextEditingController titleController,
      TextEditingController descController, index) {
    todoList[index] = Todo(
        title: titleController.text,
        desc: descController.text,
        completed: todoList[index].completed,
        dateCreated: todoList[index].dateCreated);

    Get.back();
    Get.off(() => HomePageScreen(username: username));
  }

  dynamic numOfCompletedTask() {
    if (todoList.isEmpty) {
      return 0;
    }
    return todoList.length;
  }
}
