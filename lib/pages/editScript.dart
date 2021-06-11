import 'dart:convert';

import 'package:cerebus_rex/model/scripts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart' show parse;
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html_editor_enhanced/utils/options.dart';

class Editor extends StatelessWidget {
  Editor({Key? key, required Script this.data}) : super(key: key);

  Script data;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HtmlEditorExample(title: 'Script Editor', data: data);
  }
}

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final Script data;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final _editorHeight = _media.height - 100;

    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your script here...',
                  shouldEnsureVisible: true,
                  //initialText: "<p>text content initial, if any</p>",
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  defaultToolbarButtons: [
                    FontButtons(
                      clearAll: false,
                      superscript: false,
                      subscript: false,
                    ),
                    ParagraphButtons(
                        increaseIndent: false,
                        decreaseIndent: false,
                        textDirection: false,
                        lineHeight: false,
                        caseConverter: false),
                  ],
                  toolbarPosition: ToolbarPosition.aboveEditor, //by default
                  toolbarType: ToolbarType.nativeGrid, //by default
                  onButtonPressed: (ButtonType type, bool? status,
                      Function()? updateStatus) {
                    return true;
                  },
                ),
                otherOptions: OtherOptions(height: _editorHeight),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        controller.clear();
                      },
                      child: Text('重置', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).accentColor),
                      onPressed: () async {
                        var txt = await controller.getText();
                        if (txt.contains('src=\"data:')) {
                          txt =
                              '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                        }

                        var doc = parse(txt);
                        var script_content = doc.body.text;

                        updateScript(script_content, widget.data.id);

                        Fluttertoast.showToast(
                            msg: script_content,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        this.setState(() {
                          result = script_content;
                        });
                      },
                      child: Text(
                        '提交',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

updateScript(String content, int script_id) async {
  var response = await Dio().post("http://sakura.cn.utools.club/script/update",
      data: jsonEncode({
        "id": script_id,
        "script": content,
      }));
}
