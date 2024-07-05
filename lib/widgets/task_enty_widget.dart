import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/widgets/dialog_widget.dart';

class TaskEntry extends StatelessWidget {
  const TaskEntry({
    super.key,
    required this.taskIndex,
  });

  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    //  bool isCompleted = false;

    var controller = Get.put(TodoController());
    return GetX<TodoController>(builder: (controller) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Checkbox(
            activeColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            onChanged: (val) {
              //  print("${taskList[index][0]}");

              controller.taskList[taskIndex][0] =
                  !controller.taskList[taskIndex][0];
            },
            value: controller.taskList[taskIndex][0],
          ),
          trailing: IconButton(
              onPressed: () {
                Get.dialog(
                  DialogWidget(
                    /*   onCancel: () {
                      controller.cancelNewTaskEntry(controller.titleController);
                    },
                    onSave: () {
                      controller.editTask(
                          taskIndex, controller.titleController.text);

                      /*controller.editTask(
                                  controller.taskList[index], index)*/
                    }, */
                    task: controller.taskList[taskIndex],
                    taskIndex: taskIndex,
                    //  newTaskController: controller.titleController,
                    edit: true,
                  ),
                  barrierDismissible: false,
                );
              },
              icon: const Icon(
                Icons.mode_edit_outlined,
                size: 20,
              )),
          subtitle: Text(controller.taskList[taskIndex][2],
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          title: Text(controller.taskList[taskIndex][1],
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        ),
      );
    });
  }
}
