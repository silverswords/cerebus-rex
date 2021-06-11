import 'package:cerebus_rex/model/scripts.dart';
import 'package:cerebus_rex/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScriptList extends StatefulWidget {
  ScriptList(
    this.onClickCard, {
    Key? key,
  });
  final Function(BuildContext context, Script data) onClickCard;
  @override
  ScriptListState createState() => new ScriptListState();
}

class ScriptListState extends State<ScriptList> {
  String scriptName = "";
  String scriptType = "";

  void initState() {
    super.initState();
    final scriptsModel = Provider.of<ScriptsModel>(context, listen: false);
    scriptsModel.getScripts();
  }

  void _addScriptModal(BuildContext context) {
    final scriptsModel = context.read<ScriptsModel>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('增加脚本'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '脚本名称',
                ),
                onChanged: (value) {
                  scriptName = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '脚本类型',
                ),
                onChanged: (value) {
                  scriptType = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('提交'),
              onPressed: () {
                scriptsModel.addScript(scriptName, scriptType);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    double _width = _media.width - 250;
    var items = context.watch<ScriptsModel>().scripts;
    return Container(
      width: _width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 16, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      '脚本数量:${items.length}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff272D34),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Color(0xff272D34))),
                    onPressed: () {
                      _addScriptModal(context);
                    },
                    child: Text(
                      '新增脚本',
                      style: TextStyle(backgroundColor: Color(0xff272D34)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 7, right: 7),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.618,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    onClick: () {
                      widget.onClickCard(context, items[index]);
                    },
                    title: items[index].name,
                    subTitle: items[index].type,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
