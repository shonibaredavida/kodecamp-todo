import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/utils/constants/colors.dart';
import 'package:todo/utils/constants/sizes.dart';
import 'package:todo/widgets/dialog_widget.dart';
import 'package:todo/widgets/home_card_widget.dart';
import 'package:todo/widgets/overlay_icon_widget.dart';
import 'package:todo/widgets/task_enty_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
    required this.username,
  });
  final String username;

  //List taskList = [];

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());
    String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
    controller.username = username;

    void showScreenDialog() {
      Get.generalDialog(
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: const Color.fromARGB(137, 200, 197, 197),
        transitionDuration: const Duration(milliseconds: 220),
        pageBuilder:
            (context, Animation animation, Animation secondaryAnimation) {
          return Scaffold(
            backgroundColor: Colors.black87.withOpacity(0.04),
            body: Stack(
              children: [
                //cancel dialog screen

                Positioned(
                    bottom: 230,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.dialog(
                            const DialogWidget(),
                            barrierDismissible: false,
                          );
                        },
                        child: const OverlayIcon(
                          text: 'Create Task',
                          icons: Icons.check_circle_outline_rounded,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 120,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 36.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.cancel_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 38, 37, 37),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 160,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: OverlayIcon(
                      text: 'Create Project',
                      icons: Icons.note_add_outlined,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
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
          showScreenDialog();
          /*   showDialog(
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
              }); */
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
              //hello text
              Row(
                children: [
                  Expanded(
                    child: Text(
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
                    width: AppSizes.spaceBtwInputFields,
                  ),
                  const Icon(
                    Icons.notifications_none,
                    size: AppSizes.spaceBtwSectionsSm,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetX<TodoController>(builder: (todoController) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                          requiredIcon: const Icon(Icons.list_sharp),
                          cardTitle: "Total Task",
                          cardValue: controller.taskList.length.toString()),
                      const SizedBox(
                        width: AppSizes.defaultSpace,
                      ),
                      HomeCard(
                          requiredIcon:
                              const Icon(Icons.playlist_add_check_rounded),
                          cardTitle: "Task Completed ",
                          cardValue: controller
                              .getNumOfCompletedTask(controller.toggleStates)
                              .toString()),
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                //listview of task
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
                child: GetX<TodoController>(builder: (todoController) {
                  return todoController.taskList.isNotEmpty
                      ? ListView.builder(
                          itemCount: todoController.taskList.length,
                          itemBuilder: (context, int index) {
                            return Dismissible(
                              key: ValueKey(todoController.taskList[index]),
                              onDismissed: (direction) {
                                String itemName =
                                    todoController.taskList[index][0];
                                todoController.taskList.removeAt(index);
                                todoController.toggleStates.removeAt(index);

                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: "",
                                    duration: const Duration(seconds: 3),
                                    message: "$itemName was deleted",
                                  ),
                                );
                              },
                              background: Container(
                                color: Colors.red,
                                child: const Icon(Icons.delete),
                              ),
                              child: TaskEntry(taskIndex: index),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "No Task Added",
                            style: TextStyle(fontSize: AppSizes.fontSizeMd),
                          ),
                        );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
