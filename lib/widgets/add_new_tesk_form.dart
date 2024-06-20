import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTaskForm extends StatelessWidget {
  const NewTaskForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newFormKey = GlobalKey<FormState>();
    String formattedInputDate =
        DateFormat('MMM d, HH:mm a').format(DateTime.now());
    String newtaskName = "";
    return Form(
      key: newFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "Task Title"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a Title";
              }
              newtaskName = value;
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (newFormKey.currentState!.validate()) {
                      print(newtaskName);

                      newFormKey.currentState!.save();
                    }
                  },
                  child: const Text("Save"))
            ],
          )
        ],
      ),
    );
  }
}
