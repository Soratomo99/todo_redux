import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/action.dart';
import 'package:task_management/store/reducer.dart';
import 'package:task_management/store/view_model.dart';

void main() {
  group("test change page", () {
    test("get page", () {
      final store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState());
      final viewModel = ViewModel.create(store);
      expect(viewModel.page, 1);
    });

    test("change page", () {
      final store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState());
      final viewModel = ViewModel.create(store);
      viewModel.goToPage(2);
      expect(store.state.page, 2);
    });
  });

  group("test add task", () {
    test("add task reducer", () {
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      final AppState appState = AppState.initialState();
      final AppState newAppState =
          appStateReducer(appState, AddTaskAction(dateTime, detail));
      expect(newAppState.tasks.length, 1);
      expect(newAppState.tasks.first.detail, "New Task Title");
    });

    test("add task view_model", () {
      final store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState());
      final viewModel = ViewModel.create(store);
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      viewModel.addTaskCallback(dateTime, detail);

      expect(store.state.tasks.length, 1);
      expect(store.state.tasks.first.detail, "New Task Title");
    });
  });

  group("test update task", () {
    test("add update task reducer", () {
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      final AppState appState = AppState.initialState();
      final AppState newAppState =
          appStateReducer(appState, AddTaskAction(dateTime, detail));
      expect(newAppState.tasks.length, 1);
      expect(newAppState.tasks.first.detail, "New Task Title");
      expect(newAppState.tasks.first.isDone, false);
      final AppState finalAppStateTest = appStateReducer(
          newAppState, UpdateTaskAction(newAppState.tasks.first));
      expect(finalAppStateTest.tasks.first.isDone, true);
    });

    test("add update task view_model", () {
      final store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState());
      final viewModel = ViewModel.create(store);
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      viewModel.addTaskCallback(dateTime, detail);
      expect(store.state.tasks.length, 1);
      expect(store.state.tasks.first.detail, "New Task Title");
      expect(store.state.tasks.first.isDone, false);
      viewModel.updateTask(store.state.tasks.first);
      expect(store.state.tasks.first.isDone, true);
    });
  });

  group("test delete task", () {
    test("add delete task reducer", () {
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      final AppState appState = AppState.initialState();
      final AppState newAppState =
          appStateReducer(appState, AddTaskAction(dateTime, detail));
      expect(newAppState.tasks.length, 1);
      expect(newAppState.tasks.first.detail, "New Task Title");
      expect(newAppState.tasks.first.isDone, false);
      final AppState finalAppStateTest = appStateReducer(
          newAppState, DeleteTaskAction(newAppState.tasks.first));
      expect(finalAppStateTest.tasks.length, 0);
    });

    test("add delete task view_model", () {
      final store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState());
      final viewModel = ViewModel.create(store);
      final DateTime dateTime = DateTime.now();
      final String detail = "New Task Title";
      viewModel.addTaskCallback(dateTime, detail);
      expect(store.state.tasks.length, 1);
      expect(store.state.tasks.first.detail, "New Task Title");
      expect(store.state.tasks.first.isDone, false);
      viewModel.deleteTask(store.state.tasks.first);
      expect(store.state.tasks.length, 0);
    });
  });
}
