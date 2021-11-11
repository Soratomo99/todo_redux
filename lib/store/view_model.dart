import 'package:redux/redux.dart';
import 'package:task_management/store/action.dart';
import 'package:task_management/store/model.dart';

class ViewModel {
  final int page;
  final Function(int) goToPage;
  final List<Task> tasks;
  final Function(DateTime, String) addTaskCallback;
  final Function(Task) updateTask;
  final Function(Task) deleteTask;
  final List<Task> tasksDone;
  final List<Task> tasksDoing;

  ViewModel({
    required this.page,
    required this.goToPage,
    required this.tasks,
    required this.addTaskCallback,
    required this.updateTask,
    required this.deleteTask,
    required this.tasksDone,
    required this.tasksDoing,
  });
  factory ViewModel.create(Store<AppState> store) {
    _onGoToPage(int value) => store.dispatch(ChangePageAction(value));

    _onGetPageValue() => store.state.page;

    _onAddTaskCallback(DateTime dateTime, String detail) =>
        store.dispatch(AddTaskAction(dateTime, detail));

    _onGetTasks() {
      return store.state.tasks;
    }

    _onUpdateTask(Task task) => store.dispatch(UpdateTaskAction(task));

    _onDeleteTask(Task task) => store.dispatch(DeleteTaskAction(task));

    _onTaskDone() {
      List<Task> tasksDone = <Task>[];
      for (var item in store.state.tasks) {
        if (item.isDone == true) {
          tasksDone.add(item);
        }
      }
      return tasksDone;
    }

    _onTaskDoing() {
      List<Task> tasksDoing = <Task>[];
      for (var item in store.state.tasks) {
        if (item.isDone == false) {
          tasksDoing.add(item);
        }
      }
      return tasksDoing;
    }

    return ViewModel(
      page: _onGetPageValue(),
      goToPage: _onGoToPage,
      tasks: _onGetTasks(),
      addTaskCallback: _onAddTaskCallback,
      updateTask: _onUpdateTask,
      deleteTask: _onDeleteTask,
      tasksDone: _onTaskDone(),
      tasksDoing: _onTaskDoing(),
    );
  }
}
