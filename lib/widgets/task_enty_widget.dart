import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/screens/todo_details_screen.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';
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

    final controller = Get.put(TodoController());
    //   var checkState = controller.taskList[taskIndex][0].obs;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Obx(() => Checkbox(
              value: controller.todoList[taskIndex].completed,
              activeColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              onChanged: (val) => controller.toggleComplet(taskIndex),
            )),
        title: GestureDetector(
          child: Obx(() => Text(
                controller.todoList[taskIndex].title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              )),
          onTap: () {
            Get.to(TaskDetailsScreen(taskIndex: taskIndex));
            print("newdddddd");
          },
        ),
        subtitle: GestureDetector(
          child: Obx(() => Text(
                controller.todoList[taskIndex].desc,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                overflow: TextOverflow.visible,
              )),
          onTap: () {
            print("newdddddd");
            Get.to(TaskDetailsScreen(taskIndex: taskIndex));
          },
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Text(
                controller.todoList[taskIndex].dateCreated,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              onTap: () {
                print("newdddddd");
                Get.to(TaskDetailsScreen(taskIndex: taskIndex));
              },
            ),
            const SizedBox(
              width: 0.3 * AppSizes.spaceBtwSectionsSm,
            ),
            IconButton(
              onPressed: () {
                Get.dialog(
                  DialogWidget(
                    taskIndex: taskIndex,
                  ),
                  barrierDismissible: false,
                );
              },
              icon: const Icon(
                Icons.mode_edit_outlined,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
