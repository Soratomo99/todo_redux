import 'package:flutter/material.dart';
import 'package:task_management/screens/doing_task_screen/list_doing_task.dart';
import 'package:task_management/screens/widgets/bottom_bar.dart';
import 'package:task_management/screens/widgets/button_add_task.dart';

class DoingTasksScreen extends StatelessWidget {
  const DoingTasksScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        // floating button
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: ButtonAddTask(),

        // bottom bar
        bottomNavigationBar: BottomBar(),

        // UI center page
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  "Task Management",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 48),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 200,
                      child: Center(
                        child: Text(
                          "Doing Tasks",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListDoingTasks(),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
