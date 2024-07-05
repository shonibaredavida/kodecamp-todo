import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    super.key,
    this.edit = false,
    this.task,
    this.taskIndex,
  });
  final bool edit;
  final List? task;
  final int? taskIndex;
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TodoController());
    return AlertDialog(
        content: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.edit
              ? const Text(
                  "Edit the Task Title",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : Container(),
          SizedBox(
            height: widget.edit ? AppSizes.spaceBtwItems : 0,
          ),
          TextFormField(
            controller: widget.edit
                ? controller.editTitleController
                : controller.titleController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Task Title",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          showError
              ? const Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.sm),
                  child: Text(
                    "Title must be more than 3 characters",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.edit
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {
                        if (controller.editTitleController.text.length < 4) {
                          //   setState(() {
                          showError = true;
                          // });
                          return;
                        }
                        controller.editTask(controller.editTitleController.text,
                            widget.taskIndex);
                      },
                      child: const Text("Save"),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: () {
                        if (controller.titleController.text.length < 4) {
                          //   setState(() {
                          showError = true;
                          // });
                          return;
                        }

                        controller.addTask(controller.titleController.text);
                      },
                      child: const Text("Save"),
                    ),
              TextButton(
                onPressed: () {
                  controller.cancelNewTaskEntry(controller.titleController);
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
