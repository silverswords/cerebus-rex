import 'package:flutter/material.dart';

class ParamInput with ChangeNotifier {
  Map<String, String> _params = Map();
  
  Map<String, String> get params => _params;

  void addParam(String key, String value) {
    params[key] = value;
    notifyListeners();
  }
} 