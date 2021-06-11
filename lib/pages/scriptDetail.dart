import 'package:cerebus_rex/model/paramInput.dart';
import 'package:cerebus_rex/model/tasks.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_picker/Picker.dart';

class ScriptDetailPage extends StatelessWidget {
  ScriptDetailPage({Key? key});
  final formKey = GlobalKey<FormState>();
  var _keyController = TextEditingController();
  var _valueController = TextEditingController();

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

  Widget _buildInput(BuildContext context) {
    ParamType type = context.watch<ParamInput>().type;

    switch (type) {
      case ParamType.String:
        return TextField(
          controller: _valueController,
          onChanged: (text) {
            context.read<ParamInput>().setInputValue(text);
          },
          decoration: InputDecoration(
            labelText: "value",
            filled: true,
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
      case ParamType.Bool:
        return ElevatedButton(
          onPressed: () => showPickerBool(context),
          child: Text("选择"),
        );
      case ParamType.Number:
        return TextField(
          controller: _valueController,
          onChanged: (text) {
            late int num;
            try {
              num = int.parse(text);
            } catch (e) {
              Fluttertoast.showToast(
                msg: "请输入数字",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
                webBgColor: "red",
              );
              return;
            }

            context.read<ParamInput>().setInputValue(num);
          },
          decoration: InputDecoration(
            labelText: "value",
            filled: true,
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
      default:
        return Text("不支持的类型");
    }
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                "当前类型: ${ParamType2String(context.watch<ParamInput>().type)}"),
                            ElevatedButton(
                              onPressed: () => showPickerIcons(context),
                              child: Text("选择类型"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              child: TextField(
                                controller: _keyController,
                                onChanged: (text) {
                                  context.read<ParamInput>().setInputKey(text);
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  labelText: "key",
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
                              child: _buildInput(context),
                            ),
                          ],
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
                        context.read<ParamInput>().addParam();
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

showPickerIcons(BuildContext context) {
  Picker(
    adapter: PickerDataAdapter(data: [
      PickerItem(text: Text("Number"), value: ParamType.Number),
      PickerItem(text: Text("Bool"), value: ParamType.Bool),
      PickerItem(text: Text("String"), value: ParamType.String),
      PickerItem(text: Text("JSON"), value: ParamType.JSON),
    ]),
    title: Text("Select Icon"),
    onConfirm: (Picker picker, List value) {
      context.read<ParamInput>().changeInputType(ParamType.values[value[0]]);
    },
  ).showModal(context);
}

showPickerBool(BuildContext context) {
  new Picker(
    adapter: PickerDataAdapter(data: [
      PickerItem(text: Text("True"), value: true),
      PickerItem(text: Text("False"), value: false),
    ]),
    onConfirm: (Picker picker, List value) {
      context.read<ParamInput>().setInputValue(value[0]);
    },
  ).showModal(context);
}
