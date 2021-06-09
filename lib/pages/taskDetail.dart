import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/widgets/list.dart';
import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/model/paramInput.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;
  TaskDetailPage(this.task, {Key? key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text("任务详情"),
        leading: IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            // tooltip: 'Add Alarm',
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ParamInput(),
        builder: (context, child) {
          return Center(
            child: Column(
              children: [
                Text(task.name),
                Text(task.type),
                Text(task.state.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
