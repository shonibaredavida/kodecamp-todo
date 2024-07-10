// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/screens/home_page_screen.dart';

class TodoController extends GetxController {
  // var todos = <Todo>[].obs;
  var username;
  List taskList = <List<dynamic>>[].obs;

  List toggleStates = [].obs;

  String textToSentenceCase(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  void toggleComplet(int outerIndex) {
    toggleStates[outerIndex] = !toggleStates[outerIndex];
    update();
  }

  int getNumOfCompletedTask(taskList) {
    int count = 0;
    if (toggleStates.isEmpty) {
      return count = 0;
    }
    for (final eachList in toggleStates) {
      if (eachList) {
        count++;
      }
    }
    return count;
  }

  addTask(TextEditingController descriptionController,
      TextEditingController titleController) {
    //   print(taskList.length);
    taskList.add([
      textToSentenceCase(titleController.text),
      textToSentenceCase(descriptionController.text),
      DateFormat('yMd').format(DateTime.now())
    ]);
    toggleStates.add(false);
    //  print(taskList.length);
    //print(taskList);
    Get.back();
    Get.off(() => HomePageScreen(username: username));
  }

  removeTask(taskList, index) {
    taskList.removeAt(index);
    toggleStates.removeAt(index);
  }

  editTask(TextEditingController titleController,
      TextEditingController descController, index) {
    taskList[index][0] = titleController.text;
    taskList[index][1] = descController.text;
    // print("...edit " + taskList[index].toString());
    Get.back();
    Get.off(() => HomePageScreen(username: username));
  }

  dynamic numOfCompletedTask() {
    if (taskList.isEmpty) {
      return 0;
    }
    return taskList.length;
  }
}
