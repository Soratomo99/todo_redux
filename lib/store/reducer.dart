import 'package:task_management/store/action.dart';
import 'package:task_management/store/model.dart';

AppState appStateReducer(AppState state, action) {
  if (action is ChangePageAction) {
    final newAppState = AppState(page: action.pageGoTo, tasks: state.tasks);
    return newAppState;
  }

  if (action is AddTaskAction) {
    final List<Task> newTasks = []
      ..addAll(state.tasks)
      ..add(Task(
        dateTime: action.newDateTime,
        detail: action.newTaskDetail,
        isDone: false,
      ));
    final AppState newAppState = state.updateTasks(newTasks);
    return newAppState;
  }

  if (action is UpdateTaskAction) {
    List<Task> newTasks = [];
    state.tasks.forEach((element) {
      if (element.dateTime == action.task.dateTime) {
        final newTask = element.update(!element.isDone);

        newTasks.add(newTask);
      } else {
        newTasks.add(element);
      }
    });
    final AppState newAppState = state.updateTasks(newTasks);
    return newAppState;
  }

  if (action is DeleteTaskAction) {
    final List<Task> newTasks = []
      ..addAll(state.tasks)
      ..remove(action.task);
    final AppState newAppState = state.updateTasks(newTasks);
    return newAppState;
  }

  return state;
}
