import 'package:flutter/material.dart';
import 'package:cerebus_rex/widgets/paramInput.dart';
import 'package:cerebus_rex/model/paramInput.dart';
import 'package:provider/provider.dart';

class ScriptDetailPage extends StatelessWidget {
  ScriptDetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text("脚本详情"),
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MultiProvider(
      providers: [
        ChangeNotifierProvider<ParamInput>(create: (_) => ParamInput()),
      ],
      child: ParamFrom(),
      )
    );
  }
}
