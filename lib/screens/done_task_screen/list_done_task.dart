import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/view_model.dart';

class ListDoneTask extends StatelessWidget {
  const ListDoneTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        onInitialBuild: (viewModel) {},
        builder: (context, viewModel) {
          final List<Task> tasks = viewModel.tasksDone;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].detail,
                  style: TextStyle(color: Colors.green),
                ),
              );
            },
          );
        });
  }
}
