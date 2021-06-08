import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/widgets/list.dart';
import 'package:cerebus_rex/model/tasks.dart';

class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWidget(taskItems),
    );
  }
}
