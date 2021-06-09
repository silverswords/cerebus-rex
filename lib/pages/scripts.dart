import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/widgets/script.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();
  }

  get count => _count;
}

class ScriptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: scriptList(taskItems),
    );
  }
}
