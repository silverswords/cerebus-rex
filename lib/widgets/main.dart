import 'package:cerebus_rex/model/menu.dart';
import 'package:cerebus_rex/pages/tasks.dart';
import 'package:cerebus_rex/widgets/menu.dart';
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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return TasksPage();
      case 1:
        return Text('hello');

      case 2:
        return Text("发布任务");
      default:
        return Text("404");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuModel>(create: (_) => MenuModel()),
      ],
      builder: (context, child) {
        return Center(
          child: Row(
            children: [
              SideBarMenu(),
              Center(
                child: getPages(Provider.of<MenuModel>(context).selectIndex),
              ),
            ],
          ),
        );
      },
    );
  }
}
