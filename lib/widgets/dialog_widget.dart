import 'package:flutter/material.dart';
import 'package:todo/widgets/constants.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.newTaskController,
    this.edit = false,
    this.task,
  });
  final VoidCallback onSave, onCancel;
  final bool edit;
  final List? task;
  final TextEditingController newTaskController;
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool showError = false;

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      widget.newTaskController.text = widget.task![1];
    }
  }

  @override
  Widget build(BuildContext context) {
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
            height: widget.edit ? 15 : 0,
          ),
          TextFormField(
            controller: widget.newTaskController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Task Title",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          const SizedBox(
            height: 20,
          ),
          showError
              ? const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Title must be more than 3 characters",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  if (widget.newTaskController.text.length < 4) {
                    setState(() {
                      showError = true;
                    });
                    return;
                  }
                  widget.onSave();
                },
                child: const Text("Save"),
              ),
              TextButton(
                onPressed: widget.onCancel,
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
