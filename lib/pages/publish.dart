import 'package:cerebus_rex/model/scripts.dart';
import 'package:cerebus_rex/pages/scriptDetail.dart';
import 'package:cerebus_rex/widgets/script.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScriptsModel(),
      child: Container(
        child: ScriptList(
          (BuildContext context, dynamic data) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ScriptDetailPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
