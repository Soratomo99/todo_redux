import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/view_model.dart';

class ListAllTask extends StatelessWidget {
  const ListAllTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        onInitialBuild: (viewModel) {},
        builder: (context, viewModel) {
          final List<Task> tasks = viewModel.tasks;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () => viewModel.deleteTask(tasks[index]),
                title: Text(
                  tasks[index].detail,
                  style: TextStyle(
                      decoration: tasks[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                trailing: Checkbox(
                  value: tasks[index].isDone,
                  onChanged: (bool) {
                    viewModel.updateTask(tasks[index]);
                  },
                ),
              );
            },
          );
        });
  }
}
