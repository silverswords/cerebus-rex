import 'package:cerebus_rex/widgets/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
  int index = 0;

  void changePage(int index) {
    setState(() {
      this.index = index;
    });
  }

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return Text("所有任务");
      case 1:
        return Column(
          children: <Widget>[
            Container(
              width: 100,
              child: HtmlEditor(
                hint: "Your text here...",
                //value: "text content initial, if any",
                key: keyEditor,
                height: 400,
              ),
            )
          ],
        );

      case 2:
        return Text("发布任务");
      default:
        return Text("404");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          children: [
            SideBarMenu(changePage),
            Center(
              child: getPages(index),
            ),
          ],
        ),
      ),
    );
  }
}
