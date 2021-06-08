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
  String position = "";
  DateTime publishTime = DateTime.parse("1970-01-01 00:00:00Z");
  DateTime runningTime = DateTime.parse("1970-01-01 00:00:00Z");
  Task({
    required this.name,
    required this.type,
    required this.state,
    required this.position,
  });
}

List<Task> taskItems = [
  Task(
    name: 'Elite Admin',
    type: '任务',
    state: TaskState.Pending,
    position: 'Web Designer',
  ),
  Task(
    name: 'Real Homes',
    type: '任务',
    state: TaskState.Finished,
    position: 'Project Manager',
  ),
  Task(
    name: 'Flutter Web',
    type: '任务',
    state: TaskState.Finished,
    position: 'Developer',
  ),
  Task(
    name: 'Elite Admin',
    type: '任务',
    state: TaskState.Running,
    position: 'Frontend Eng',
  ),
  Task(
    name: 'Helping Hands',
    type: '任务',
    state: TaskState.Error,
    position: 'Content Writer',
  ),
];
