import 'package:flutter/foundation.dart';
import 'package:task_management/store/model.dart';

@immutable
class ChangePageAction {
  final int pageGoTo;
  ChangePageAction(this.pageGoTo);
}

@immutable
class AddTaskAction {
  final DateTime newDateTime;
  final String newTaskDetail;
  AddTaskAction(this.newDateTime, this.newTaskDetail);
}

@immutable
class UpdateTaskAction {
  final Task task;
  UpdateTaskAction(this.task);
}

@immutable
class DeleteTaskAction {
  final Task task;
  DeleteTaskAction(this.task);
}
