import 'package:cerebus_rex/config/theme.dart';
import 'package:cerebus_rex/model/menu.dart';
import 'package:cerebus_rex/pages/scriptDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  const ListWidget(
    this.items, {
    Key? key,
  }) : super(key: key);

  final List<dynamic> items;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    double _width = _media.width - 300;
    bool _collapsed = context.watch<MenuModel>().collapsed;
    if (_collapsed) {
      _width = _media.width - 120;
    }
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: _width + 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: 20,
                  child: Text(
                    'All of the Tasks',
                    style: cardTitleTextStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //SizedBox(width: 2),
                          Container(
                            width: _width / 5,
                            child: Text(
                              '任务名称',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: _width / 5,
                            child: Text(
                              '任务类型',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: _width / 5,
                            child: Text(
                              '任务状态',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: _width / 5,
                            child: Text(
                              '开始时间',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: _width / 5,
                            child: Text(
                              '发布时间',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ScriptDetailPage(),
                                        // settings:
                                        //     RouteSettings(name: TaskDetailPage.name),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: _width / 5,
                                    child: Text(
                                      items[index].name,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: _width / 5,
                                  child: Text(items[index].type),
                                ),
                                Container(
                                    width: _width / 5,
                                    child: Row(
                                      children: [
                                        Chip(
                                          label: Text(
                                            items[index].state.index == 0
                                                ? 'Pending'
                                                : items[index].state.index == 1
                                                    ? 'Running'
                                                    : items[index]
                                                                .state
                                                                .index ==
                                                            2
                                                        ? 'Finished'
                                                        : 'Error',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: items[index]
                                                      .state
                                                      .index ==
                                                  0
                                              ? Colors.blue
                                              : items[index].state.index == 1
                                                  ? Colors.yellow[700]
                                                  : items[index].state.index ==
                                                          2
                                                      ? Colors.green
                                                      : Colors.red,
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: _width / 5,
                                  child: Text(DateFormat('kk:mm:ss d MMM yyyy')
                                      .format(items[index].publishTime)),
                                ),
                                Container(
                                  width: _width / 5,
                                  child: Text(DateFormat('kk:mm:ss d MMM yyyy')
                                      .format(items[index].runningTime)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
