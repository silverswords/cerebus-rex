import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:minio/io.dart';
import 'package:minio/minio.dart';
import 'dart:convert';

enum TaskState {
  Pending,
  Running,
  Finished,
  Error,
  Unknown,
}

class Task {
  int id = 0;
  String name = "";
  String type = "";
  TaskState state = TaskState.Pending;
  int scriptID = 0;
  String scriptName = '';

  DateTime publishTime = DateTime.parse("1970-01-01 00:00:00Z");
  DateTime startTime = DateTime.parse("1970-01-01 00:00:00Z");
  DateTime finishedTime = DateTime.parse("1970-01-01 00:00:00Z");

  Task({
    required this.id,
    required this.name,
    required this.type,
    required this.state,
    required this.scriptID,
    required this.scriptName,
    required this.publishTime,
    required this.startTime,
    required this.finishedTime,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      type: json['script_type'],
      state: string2TaskState(json['state']),
      scriptID: json['script_id'],
      scriptName: json['script_name'],
      publishTime: DateTime.parse(json['create_time']),
      startTime: DateTime.parse(json['start_time']),
      finishedTime: DateTime.parse(json['finished_time']),
    );
  }
}

class TasksModel with ChangeNotifier {
  List<Task> _tasks = List.empty(growable: true);
  List<String> _taskResult = List.empty();
  final minio = Minio(
    endPoint: 'server',
    port: 9000,
    accessKey: 'minioadmin',
    secretKey: 'minioadmin',
    useSSL: false,
  );

  List<Task> get tasks => _tasks;
  List<String> get taskResult => _taskResult;

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

  getTaskResult(int id) async {
    var stream = await minio.getObject('task', '$id.txt');
    List<String> result = List.empty(growable: true);
    await for (var value in stream.transform(utf8.decoder)) {
      result.add(value);
    }

    _taskResult = result;
    notifyListeners();
  }
}

TaskState string2TaskState(String type) {
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
