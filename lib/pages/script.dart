import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/model/paramInput.dart';

class ScriptDetailPage extends StatelessWidget {
  ScriptDetailPage({Key? key});
  final formKey = GlobalKey<FormState>();
  var _keyController = TextEditingController();
  var _valueController = TextEditingController();
  String inputKey = "";
  String inputValue = "";

  List<Widget> _buildList(BuildContext context) {
    Map<String, String> params = context.watch<ParamInput>().params;
    List<Widget> result = List.empty(growable: true);
    params.forEach((key, value) {
      result.add(
        Card(
          child: Container(
            width: 540,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text(key),
                  ),
                ),
                SizedBox(
                  width: 20,
                  //child: Text("="),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text(value),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });

    return result;
  }

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
            // tooltip: 'Add Alarm',
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ParamInput(),
        builder: (context, child) {
          return Center(
            child: Column(
              children: [
                ..._buildList(context),
                Card(
                  child: Container(
                    width: 540,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: TextField(
                            controller: _keyController,
                            onChanged: (text) {
                              inputKey = text;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "key",
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 200,
                          child: TextField(
                            
                            controller: _valueController,
                            onChanged: (text) {
                              inputValue = text;
                            },
                            decoration: InputDecoration(
                              hintText: "value",
                              filled: true,
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ParamInput>()
                            .addParam(inputKey, inputValue);
                      },
                      child: Text("添加"),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("提交"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
