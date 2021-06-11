import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

enum TaskState {
  Pending,
  Running,
  Finished,
  Error,
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
      state: TaskState.Pending,
      publishTime: DateTime.parse(json['create_time']),
      startTime: DateTime.parse(json['start_time'])
    );
  }
}

class TasksModel with ChangeNotifier {
  List<Task> _tasks = List.empty(growable: true);

  List<Task> get tasks => _tasks;

  getTasks() async {
    var response = await Dio().get("https://dovics.cn.utools.club/tasks");
    var list = response.data['tasks'];

    List<Task> result = List.empty(growable: true);
    for (var item in list) {
      print(item);
      result.add(Task.fromJson(item));
    }

    _tasks = result;
    notifyListeners();
  }
}

List<Task> taskItems = [
  Task(
    name: 'Elite Admin',
    type: '爬虫',
    state: TaskState.Pending,
    publishTime: DateTime.parse("1989-01-01 00:00:00Z"),
    startTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Real Homes',
    type: '计算',
    state: TaskState.Finished,
    publishTime: DateTime.parse("2021-01-01 00:00:00Z"),
    startTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Flutter Web',
    type: '定时任务',
    state: TaskState.Finished,
    publishTime: DateTime.parse("5412-01-01 00:00:00Z"),
    startTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Elite Admin',
    type: '一次性任务',
    state: TaskState.Running,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2008-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    startTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
];
