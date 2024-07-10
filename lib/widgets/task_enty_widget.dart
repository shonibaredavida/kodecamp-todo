import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
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
              value: controller.toggleStates[taskIndex],
              activeColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              onChanged: (val) => controller.toggleComplet(taskIndex),
            )),
        title: Obx(() => Text(
              controller.titleList[taskIndex],
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )),
        subtitle: Obx(() => Text(
              controller.descList[taskIndex],
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              overflow: TextOverflow.visible,
            )),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(controller.taskList[taskIndex][0],
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
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
