import 'package:flutter/material.dart';

enum ParamType {
  Number,
  Bool,
  String,
  JSON,
}

String ParamType2String(ParamType type) {
  switch (type) {
    case ParamType.String:
      return "String";
    case ParamType.Bool:
      return "Bool";
    case ParamType.Number:
      return "Number";
    case ParamType.JSON:
      return "JSON";
    default:
      return "Unknown";
  }
}

class ParamInput with ChangeNotifier {
  ParamType _type = ParamType.String;
  Map<String, String> _params = Map();
  String _inputKey = "";
  late dynamic _inputValue;

  Map<String, String> get params => _params;
  ParamType get type => _type;
  String get inputKey => _inputKey;
  dynamic get inputValue => _inputValue;
  void addParam() {
    if (inputValue == null || inputKey == "") {
      return;
    }
    params[_inputKey] = _inputValue;
    notifyListeners();
  }

  void setInputKey(String key) {
    _inputKey = key;
    notifyListeners();
  }

  void setInputValue(dynamic value) {
    _inputValue = value;
    notifyListeners();
  }

  void changeInputType(ParamType type) {
    _type = type;
    notifyListeners();
  }
}
