import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/widgets/card.dart';
import 'package:cerebus_rex/widgets/editor/editor.dart';
import 'package:flutter/material.dart';

class scriptList extends StatefulWidget {
  scriptList(
    this.items, {
    Key? key,
  });

  final List<dynamic> items;
  @override
  scriptListState createState() => new scriptListState();
}

class scriptListState extends State<scriptList> {
  String scriptName = '';
  Task task = new Task(
    name: '',
    type: '',
    state: TaskState.Pending,
    publishTime: DateTime.now(),
    startTime: DateTime.now(),
  );

  List<dynamic> items = [];

  void initState() {
    super.initState();
    items = widget.items;
  }

  void _onClickCard(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Editor();
    }));
  }

  void _addScriptModal(BuildContext context) {
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
                  task.name = value;
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
                  task.type = value;
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
                setState(() {
                  items.add(task);
                });

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
                      '脚本数量:${widget.items.length}',
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
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    onClick: () {
                      _onClickCard(context);
                    },
                    title: widget.items[index].name,
                    subTitle: widget.items[index].type,
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
