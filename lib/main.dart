import 'package:cerebus_rex/model/menu.dart';
import 'package:cerebus_rex/pages/scripts.dart';
import 'package:cerebus_rex/pages/tasks.dart';
import 'package:cerebus_rex/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

List<String> getAllScript() {
  var list = ['a', 'b', 'c', 'd'];
  return list;
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  int count = 0;
  // List<Scripts> scripts = [];
  List<String> scripts = [];
  final String title;

  void initState() {
    scripts = getAllScript();
    count = scripts.length ~/ 4 + scripts.length % 4 == 0 ? 0 : 1;
  }

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return TasksPage();
      case 1:
        return ScriptsPage();
      default:
        return Text('h');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuModel>(create: (_) => MenuModel()),
      ],
      builder: (context, child) {
        return Container(
          child: Row(
            children: [
              SideBarMenu(),
              getPages(Provider.of<MenuModel>(context).selectIndex),
            ],
          ),
        );
      },
    );
  }
}

class Scripts {
  Scripts(Key key, this.title);

  String title;
}
