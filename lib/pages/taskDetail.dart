import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cerebus_rex/widgets/list.dart';
import 'package:cerebus_rex/model/tasks.dart';
import 'package:cerebus_rex/model/paramInput.dart';
import 'package:cerebus_rex/config/theme.dart';
import 'package:intl/intl.dart';

class TaskDetailPage extends StatefulWidget {
  final Task task;
  TaskDetailPage(this.task, {Key? key});
  final formKey = GlobalKey<FormState>();

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetailPage> {
  @override
  void initState() {
    super.initState();
    if (widget.task.state == TaskState.Finished) {
      context.read<TasksModel>().getTaskResult(widget.task.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var result = context.watch<TasksModel>().taskResult;
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title:
            Center(child: Text("任务详情", style: TextStyle(color: Colors.black))),
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
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Container(
                            height: _media.height / 5,
                            child: Column(
                              children: [
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          "任务名称",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          widget.task.name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "任务类型",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          widget.task.type,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "脚本名称",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          widget.task.scriptName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "任务状态",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Chip(
                                          label: Text(
                                            widget.task.state.index == 0
                                                ? 'Pending'
                                                : widget.task.state.index == 1
                                                    ? 'Running'
                                                    : widget.task.state.index ==
                                                            2
                                                        ? 'Finished'
                                                        : 'Error',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: widget
                                                      .task.state.index ==
                                                  0
                                              ? Colors.blue
                                              : widget.task.state.index == 1
                                                  ? Colors.yellow[700]
                                                  : widget.task.state.index == 2
                                                      ? Colors.green
                                                      : Colors.red,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "创建时间",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) * 3 / 6,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          DateFormat('kk:mm:ss d MMM yyyy')
                                              .format(widget.task.publishTime),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Container(
                                      width: (_media.width - 80) / 4,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "开始时间",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 4,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          DateFormat('kk:mm:ss d MMM yyyy')
                                              .format(widget.task.startTime),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 4,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                          child: Text(
                                        "结束时间",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: (_media.width - 80) / 4,
                                      height: ((_media.height - 80) / 5- 50) / 3,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF0F0F0),
                                            width: 0.5),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Center(
                                        child: Text(
                                          DateFormat('kk:mm:ss d MMM yyyy')
                                              .format(widget.task.finishedTime),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
                Divider(),
                Container(
                  height: (_media.height - 150) / 5* 4,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return Text(result[index]);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
