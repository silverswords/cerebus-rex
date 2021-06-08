import 'package:flutter/material.dart';

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
  DateTime runningTime = DateTime.parse("1970-01-01 00:00:00Z");
  Task({
    required this.name,
    required this.type,
    required this.state,
    required this.publishTime,
    required this.runningTime,
  });
}

List<Task> taskItems = [
  Task(
    name: 'Elite Admin',
    type: '任务',
    state: TaskState.Pending,
    publishTime: DateTime.parse("1989-01-01 00:00:00Z"),
    runningTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Real Homes',
    type: '任务',
    state: TaskState.Finished,
    publishTime: DateTime.parse("2021-01-01 00:00:00Z"),
    runningTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Flutter Web',
    type: '任务',
    state: TaskState.Finished,
    publishTime: DateTime.parse("5412-01-01 00:00:00Z"),
    runningTime: DateTime.parse("1970-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Elite Admin',
    type: '任务',
    state: TaskState.Running,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    runningTime: DateTime.parse("2008-01-01 00:00:00Z"),
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    publishTime: DateTime.parse("1970-01-01 00:00:00Z"),
    runningTime: DateTime.parse("2016-01-01 00:00:00Z"),
  ),
];
