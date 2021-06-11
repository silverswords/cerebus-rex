import 'package:cerebus_rex/model/menu.dart';
import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/pages/scriptEdit.dart';
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
        home: MyHomePage(),
        routes: {
          // "/create_script": (BuildContext context) => ScriptList(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return TasksPage();
      case 1:
        return ScriptsPage();
      default:
        return Text('404');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuModel>(create: (_) => MenuModel()),
        ChangeNotifierProvider<TasksModel>(create: (_) => TasksModel()),
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
