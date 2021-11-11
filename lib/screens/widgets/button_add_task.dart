import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/view_model.dart';

class ButtonAddTask extends StatelessWidget {
  const ButtonAddTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return StoreConnector<AppState, ViewModel>(
                converter: (Store<AppState> store) => ViewModel.create(store),
                onInitialBuild: (viewModel) {},
                builder: (context, viewModel) {
                  String newTaskDetail = "null";
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 300,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            "New Task",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextField(
                            autofocus: true,
                            onChanged: (value) {
                              newTaskDetail = value;
                            },
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.addTaskCallback(
                                  DateTime.now(), newTaskDetail);
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              height: 48,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      mini: true,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
