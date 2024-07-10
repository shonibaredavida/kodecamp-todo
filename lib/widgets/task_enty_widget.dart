import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
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
              onChanged: (val) => controller.toggleComplet(taskIndex),
            )),
        title: Obx(() => Text(controller.taskList[taskIndex][1],
            style: const TextStyle(fontSize: 16, color: Colors.black))),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(() => Text(
                    controller.taskList[taskIndex][2],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.visible,
                  )),
            ),
            const SizedBox(
              width: AppSizes.spaceBtwSectionsSm,
            ),
            Text(controller.taskList[taskIndex][3],
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        trailing: IconButton(
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
      ),
    );
  }
}
