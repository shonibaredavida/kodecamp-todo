import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/functions/functions.dart';
import 'package:todo/widgets/constants.dart';
import 'package:todo/widgets/dialog_widget.dart';
import 'package:todo/widgets/home_card_widget.dart';
import 'package:todo/widgets/task_enty_widget.dart';

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
  List taskList = [];
  final _newTaskName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String username = "David";
    String formattedDate = DateFormat.yMMMEd().format(DateTime.now());

    int getNumOfCompletedTask(List taskList) {
      int count = 0;
      if (taskList.isEmpty) {
        return count = 0;
      }
      for (final eachList in taskList) {
        if (eachList[0]) {
          count++;
        }
      }
      return count;
    }

    String textToSentenceCase(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1);
    }

    void editTask(index, taskTitle) {
      setState(() {
        taskList[index][1] = taskTitle;
      });
      Navigator.pop(context);
    }

    void addTask() {
      setState(() {
        taskList.add([
          false,
          textToSentenceCase(_newTaskName.text),
          DateFormat('MMM d: h: mma').format(DateTime.now())
        ]);
        _newTaskName.text = "";
        Navigator.pop(context);
      });
    }

    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(selectedItemColor: primaryColor, items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_home_outlined),
          label: "home",
          activeIcon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_outlined),
          label: "Tasks",
          activeIcon: Icon(Icons.task),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Menu ",
          activeIcon: Icon(Icons.menu_open_sharp),
        ),
      ]),
      floatingActionButton: IconButton(
        iconSize: 60,
        icon: Icon(
          Icons.add_circle,
          //size: 40,
          color: primaryColor,
        ),
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return DialogWidget(
                  onCancel: () {
                    cancelNewTaskEntry(context, _newTaskName);
                  },
                  onSave: addTask,
                  newTaskController: _newTaskName,
                );
              });
        },
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
                      "Hello, $username 👋",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
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
                    return Dismissible(
                      key: ValueKey(taskList[index]),
                      onDismissed: (direction) {
                        String itemName = taskList[index][1];
                        taskList.removeAt(index);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "$itemName was deleted",
                              style: const TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        //  print("${taskList.length} new delete");
                      },
                      // Optional background widget
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),

                      child: TaskEntry(
                        taskInfo: taskList[index],
                        taskIndex: taskList.indexOf(taskList[index]),
                        onTaskToggle: (val) {
                          //  print("${taskList[index][0]}");
                          setState(() {
                            taskList[index][0] = !taskList[index][0];
                          });
                        },
                        editList: editTask,
                      ),
                    );
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
