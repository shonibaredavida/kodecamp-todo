import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    this.taskIndex,
  });
  final int? taskIndex;
  /* bool showError = false; */

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find();
    final titleTxt =
        taskIndex == null ? "" : controller.taskList[taskIndex!][1];

    final descTxt = taskIndex == null ? "" : controller.taskList[taskIndex!][2];
    TextEditingController titleController =
        TextEditingController(text: titleTxt);
    TextEditingController descController = TextEditingController(text: descTxt);
    return AlertDialog(
        content: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          taskIndex != null
              ? const Text(
                  "Modify Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const Text(
                  "Create New Task",
                  style: TextStyle(
                      fontSize: AppSizes.fontSizeLg,
                      fontWeight: FontWeight.bold),
                ),
          const SizedBox(
            height: AppSizes.spaceBtwItemsSm,
          ),
          TextFormField(
            controller: titleController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Title",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: descController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Description",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          /*     const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          showError
              ? Padding(
                  padding: const EdgeInsets.only(bottom: AppSizes.sm),
                  child: Text(
                    "Title must be more than 3 characters",
                    style: TextStyle(color: errorRed, fontSize: 14),
                  ),
                )
              : Container(), */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  /*     if (titleController.text.length < 4) {
                    //   setState(() {
                    showError = true;
                    // });
                    return;
                  } */
                  taskIndex != null
                      ? controller.editTask(
                          titleController, descController, taskIndex)
                      : controller.addTask(descController, titleController);
                },
                child: Text(taskIndex == null ? "Save" : "Update"),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
