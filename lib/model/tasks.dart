import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum TaskState {
  Pending,
  Running,
  Finished,
  Error,
  Unknown,
}

class Task {
  String name = "";
  String type = "";
  TaskState state = TaskState.Pending;
  DateTime publishTime = DateTime.parse("1970-01-01 00:00:00Z");
  DateTime startTime = DateTime.parse("1970-01-01 00:00:00Z");
  Task({
    required this.name,
    required this.type,
    required this.state,
    required this.publishTime,
    required this.startTime,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        name: json['name'],
        type: json['script_type'],
        state: String2TaskState(json['state']),
        publishTime: DateTime.parse(json['create_time']),
        startTime: DateTime.parse(json['start_time']));
  }
}

class TasksModel with ChangeNotifier {
  List<Task> _tasks = List.empty(growable: true);

  List<Task> get tasks => _tasks;

  getTasks() async {
    var response = await Dio().get("http://sakura.cn.utools.club/tasks");
    var list = response.data['tasks'];

    List<Task> result = List.empty(growable: true);
    for (var item in list) {
      result.add(Task.fromJson(item));
    }

    _tasks = result;
    notifyListeners();
  }
}

TaskState String2TaskState(String type) {
  switch (type) {
    case 'Pending':
      return TaskState.Pending;
    case 'Error':
      return TaskState.Error;
    case 'Running':
      return TaskState.Running;
    case 'Finished':
      return TaskState.Finished;
    default:
      return TaskState.Unknown;
  }
}
