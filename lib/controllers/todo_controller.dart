import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo_controller.dart';
import 'package:todo/screens/home_page_screen.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  List taskList = [].obs;
  var titleController;
  var editTitleController;
  var showError;
  final newTaskName = TextEditingController();
  String textToSentenceCase(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showError = false;
    titleController = TextEditingController();
    editTitleController = TextEditingController();
  }

  int getNumOfCompletedTask(taskList) {
    int count = 0;
    if (taskList.isEmpty) {
      return count = 0;
    }
    for (final eachList in taskList) {
      if (eachList[0]) {
        count++;
      }
    }
    return count;
  }

  /*  addTask(Todo item) {
    todos.add(item);
  } */
  addTask(String title) {
    taskList.add([
      false,
      textToSentenceCase(title),
      DateFormat('MMM d: h: mma').format(DateTime.now())
    ]);
    titleController.text = "";
    Get.back();
  }

  void cancelNewTaskEntry(TextEditingController controller) {
    controller.text = "";
    Get.back();
  }

  removeTask(taskList, index) {
    // todos.removeAt(index);
    taskList.removeAt(index);
  }

  //editTask(Todo item, index) {
  editTask(item, index) {
    taskList[index][1] = item;
    // print(taskList[index]);

    Get.off(HomePageScreen(username: "username"));
    update();
  }

  dynamic numOfCompletedTask() {
    // if (todos.isEmpty) {
    if (taskList.isEmpty) {
      return 0;
    }
    return taskList.length;
  }
}
