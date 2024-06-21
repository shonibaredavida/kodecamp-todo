import 'package:flutter/material.dart';
import 'package:todo/functions/functions.dart';
import 'package:todo/widgets/dialog_widget.dart';

class TaskEntry extends StatefulWidget {
  const TaskEntry({
    super.key,
    required this.taskInfo,
    required this.onTaskToggle,
    required this.taskIndex,
    required this.editList,
  });
  final void Function(dynamic, dynamic) editList;
  final List taskInfo;
  final void Function(bool?)? onTaskToggle;
  final int taskIndex;
  @override
  State<TaskEntry> createState() => _TaskEntryState();
}

class _TaskEntryState extends State<TaskEntry> {
  var titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isCompleted = false;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onChanged: widget.onTaskToggle,
          value: isCompleted,
        ),
        trailing: IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      onCancel: () {
                        cancelNewTaskEntry(context, titleController);
                      },
                      onSave: () {
                        widget.editList(widget.taskIndex, titleController.text);
                      },
                      task: widget.taskInfo,
                      newTaskController: titleController,
                      edit: true,
                    );
                  });
            },
            icon: const Icon(
              Icons.mode_edit_outlined,
              size: 20,
            )),
        subtitle: Text(widget.taskInfo[2],
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
        title: Text(widget.taskInfo[1],
            style: const TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
