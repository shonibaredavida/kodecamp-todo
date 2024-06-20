import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/constants.dart';
import 'package:todo/widgets/home_card_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({
    super.key,
    //  required this.username,
  });
  // final String username;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    String username = "David";
    List taskList = [];
    final newFormKey = GlobalKey<FormState>();
    String formattedInputDate =
        DateFormat('MMM d, HH:mm a').format(DateTime.now());
    String newtaskName = "";
    String taskCat = "Diseño de Onboarding";
    String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
    int getNumOfCompletedTask(taskList) {
      int count = 0;
      for (final eachList in taskList) {
        if (eachList[0]) {
          count++;
        }
      }
      return count;
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: IconButton(
          icon: Icon(
            Icons.add_circle,
            size: 50,
            color: primaryColor,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Form(
                    key: newFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          textAlign: TextAlign.center,
                          decoration:
                              const InputDecoration(hintText: "Task Title"),
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
                                child: const Text("Cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  if (newFormKey.currentState!.validate()) {
                                    List newTask = [
                                      false,
                                      newtaskName,
                                      formattedInputDate
                                    ];
                                    setState(() {
                                      taskList.add(newTask);
                                      Navigator.pop(context);
                                    });
                                    print(taskList);
                                    print(newTask);
                                  }
                                },
                                child: const Text("Save"))
                          ],
                        )
                      ],
                    ),
                  ));
                });
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                formattedDate,
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      //  "Hello, ${widget.username} 👋",
                      "Hello, ${username} 👋",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search_outlined,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.notifications_none,
                    size: 34,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeCard(
                        requiredIcon: const Icon(Icons.list_sharp),
                        cardTitle: "Total Task",
                        cardValue: taskList.length.toString()),
                    const SizedBox(
                      width: 20,
                    ),
                    HomeCard(
                        requiredIcon:
                            const Icon(Icons.playlist_add_check_rounded),
                        cardTitle: "Task Completed ",
                        cardValue: getNumOfCompletedTask(taskList).toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Color.fromARGB(255, 80, 107, 196),
                    ),
                    Text(" List of Tasks", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskEntry(
                        taskState: taskList[index][0],
                        taskCat: taskCat,
                        taskName: taskList[index][1]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskEntry extends StatelessWidget {
  const TaskEntry({
    super.key,
    required this.taskState,
    required this.taskCat,
    required this.taskName,
  });

  final bool taskState;
  final String taskCat;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onChanged: (val) {},
          value: taskState,
        ),
        subtitle: Text(taskCat,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
        title: Text(taskName,
            style: const TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
