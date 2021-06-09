import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/widgets/list.dart';
import 'package:cerebus_rex/model/tasks.dart';


class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWidget(taskItems),
    );
  }
}
