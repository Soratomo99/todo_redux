import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_management/screens/all_task_screen/all_task_screen.dart';
import 'package:task_management/screens/doing_task_screen/doing_task_screen.dart';
import 'package:task_management/screens/done_task_screen/done_task_screen.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/reducer.dart';
import 'package:task_management/store/view_model.dart';

void main() {
  final store =
      Store<AppState>(appStateReducer, initialState: AppState.initialState());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: StoreConnector<AppState, ViewModel>(
            converter: (Store<AppState> store) => ViewModel.create(store),
            onInitialBuild: (viewModel) {},
            builder: (context, viewModel) {
              final page = viewModel.page;
              return showScreen(page);
            }),
      ),
    );
  }
}

Widget showScreen(int page) {
  if (page == 1) {
    return AllTasksScreen();
  } else if (page == 2) {
    return DoneTasksScreen();
  } else if (page == 3) {
    return DoingTasksScreen();
  }
  return Scaffold();
}
