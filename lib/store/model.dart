import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final List<Task> tasks;
  final int page;
  AppState({required this.page, required this.tasks});

  AppState.initialState()
      : page = 1,
        tasks = <Task>[];

  AppState updateTasks(List<Task>? newTasks) {
    return AppState(page: this.page, tasks: newTasks ?? this.tasks);
  }
}

@immutable
class Task {
  final DateTime dateTime;
  final String detail;
  final bool isDone;
  Task({
    required this.dateTime,
    required this.detail,
    required this.isDone,
  });

  Task update(bool? isDone) {
    return Task(
      dateTime: this.dateTime,
      detail: this.detail,
      isDone: isDone ?? this.isDone,
    );
  }
}
