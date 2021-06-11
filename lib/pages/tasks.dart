import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/widgets/list.dart';
import 'package:cerebus_rex/model/tasks.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
    final tasksModel = Provider.of<TasksModel>(context, listen: false);
    tasksModel.getTasks();
  }

  @override
  Widget build(BuildContext context) {
     final tasksModel =  Provider.of<TasksModel>(context, listen: true);
    return Container(
      child: ListWidget(tasksModel.tasks),
    );
  }
}
