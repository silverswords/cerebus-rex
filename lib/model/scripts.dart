import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Script {
  String name = "";
  String type = "";
  String script = "";
  int id = 0;
  DateTime createTime = DateTime.parse("1970-01-01 00:00:00Z");
  Script({
    required this.name,
    required this.type,
    required this.script,
    required this.createTime,
    required this.id,
  });

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      name: json['name'],
      type: json['type'],
      script: json['script'],
      createTime: DateTime.parse(json['create_time']),
      id: json['id'],
    );
  }
}

class ScriptsModel with ChangeNotifier {
  List<Script> _scripts = List.empty(growable: true);

  List<Script> get scripts => _scripts;
  getScripts() async {
    var response = await Dio().get("http://sakura.cn.utools.club/script");
    var list = response.data['script'];

    List<Script> result = List.empty(growable: true);
    for (var item in list) {
      result.add(Script.fromJson(item));
    }

    _scripts = result;
    notifyListeners();
  }

  addScript(String name, String type) async {
    var response = await Dio().post("http://sakura.cn.utools.club/add",
        data: jsonEncode({
          "name": name,
          "type": type,
        }));
    if (response.statusCode == 200) {
      getScripts();
      notifyListeners();
    } else {}
  }
}
