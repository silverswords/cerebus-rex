import 'package:flutter/material.dart';
import './widgets/editor/layout_expanded.dart';
import './widgets/editor/settings.dart';
import 'package:cerebus_rex/widgets/menu.dart';
import 'package:cerebus_rex/pages/tasks.dart';
import 'package:cerebus_rex/model/menu.dart';
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
  // Settings? _settings;

  //  void _handleSettingsLoaded(Settings value) {
  //   setState(() {
  //     _settings = value;
  //     // _loadFromAssets();
  //   });
  // }

  //  Future<void> _loadFromAssets() async {
  //   try {
  //     final result = await rootBundle.loadString('welcome.note');
  //     final doc = NotusDocument.fromJson(jsonDecode(result));
  //     setState(() {
  //       _controller = ZefyrController(doc);
  //     });
  //   } catch (error) {
  //     final doc = NotusDocument()..insert(0, 'Empty asset');
  //     setState(() {
  //       _controller = ZefyrController(doc);
  //     });
  //   }
  // }

  //  if (_settings == null || _controller == null) {
  //     return Scaffold(body: Center(child: Text('Loading...')));
  //   }

  //   void _showSettings() async {
  //   final result = await showSettingsDialog(context, _settings);
  //   if (mounted && result != null) {
  //     setState(() {
  //       _settings = result;
  //     });
  //   }
  // }

  Widget getPages(int index) {
    switch (index) {
      case 0:
        return TasksPage();
      case 1:
        return SettingsProvider(
          // settings: _settings,
          child: ExpandedLayout(),
        );

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
        return Scaffold(
          body: Center(
            child: Row(
              children: [
                SideBarMenu(),
                Center(
                  child: getPages(Provider.of<MenuModel>(context).selectIndex),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
