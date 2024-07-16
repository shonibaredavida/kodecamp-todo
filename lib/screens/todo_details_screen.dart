import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/sizes.dart';
import 'package:todo/widgets/todo_button_widget.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({
    super.key,
    required this.taskIndex,
  });
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.todoList[taskIndex].title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 2 * AppSizes.fontSizeLg,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 120,
                  child: Text(
                    "Description:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeLg),
                  ),
                ),
                Expanded(
                  child: Text(
                    controller.todoList[taskIndex].desc,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: AppSizes.fontSizeLg),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 120,
                  child: Text(
                    "Status:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeLg),
                  ),
                ),
                Text(
                  controller.todoList[taskIndex].completed
                      ? "Completed"
                      : "Undone",
                  style: const TextStyle(fontSize: AppSizes.fontSizeMd),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 120,
                  child: Text(
                    "Date Created:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.fontSizeLg),
                  ),
                ),
                Text(
                  controller.todoList[taskIndex].dateCreated,
                  style: const TextStyle(fontSize: AppSizes.fontSizeMd),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
