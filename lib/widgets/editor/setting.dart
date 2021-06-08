import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;

class Settings {
  /// Path to assets folder. If set then edits to any document within this
  /// application can be saved back to the assets folder.
  final String? assetsPath;

  Settings({this.assetsPath});

  static Future<Settings> load() async {
    if (kIsWeb) {
      return Settings(assetsPath: '');
    }

    // final fs = LocalFileSystem();
    final dir = await pp.getApplicationSupportDirectory();
    // final file = fs.directory(dir.path).childFile('settings.json');
    // if (await file.exists()) {
    //   final json = await file.readAsString();
    //   final data = jsonDecode(json) as Map<String, dynamic>;
    //   return Settings(assetsPath: data['assetsPath'] as String?);
    // }
    return Settings(assetsPath: '');
  }

  static Settings? of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<SettingsProvider>();
    return widget?.settings;
  }

  Future<void> save() async {
    if (kIsWeb) {
      return;
    }
    // final fs = LocalFileSystem();
    final dir = await pp.getApplicationSupportDirectory();
    // final file = fs.directory(dir.path).childFile('settings.json');
    final data = {'assetsPath': assetsPath};
    // await file.writeAsString(jsonEncode(data));
  }
}

class SettingsProvider extends InheritedWidget {
  final Settings? settings;

  SettingsProvider({Key? key, this.settings, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant SettingsProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
