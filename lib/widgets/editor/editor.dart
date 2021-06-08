import 'dart:convert';

import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zefyrka/zefyrka.dart';

import 'scaffold.dart';
import 'setting.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  ZefyrController _controller = ZefyrController();
  final FocusNode _focusNode = FocusNode();

  Settings? _settings;
  bool _expands = true;

  void _handleSettingsLoaded(Settings value) {
    setState(() {
      _settings = value;
      _loadFromAssets();
    });
  }

  @override
  void initState() {
    super.initState();
    Settings.load().then(_handleSettingsLoaded);
  }

  @override
  Widget build(BuildContext context) {
    if (_settings == null) {
      return Scaffold(body: Center(child: Text('Loading...')));
    }

    Widget _buildContent(BuildContext context, ZefyrController controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ZefyrEditor(
            controller: controller,
            focusNode: _focusNode,
            autofocus: true,
            expands: _expands,
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      );
    }

    void _toggleExpands() {
      setState(() {
        _expands = _expands;
      });
    }

    return DemoScaffold(
      documentFilename: 'layout_expanded.note',
      builder: _buildContent,
      actions: [
        IconButton(
          onPressed: _toggleExpands,
          icon: Icon(
            _expands ? Icons.unfold_less : Icons.expand,
            color: Colors.grey.shade800,
            size: 18,
          ),
        )
      ],
    );
  }

  Future<void> _loadFromAssets() async {
    try {
      final result = await rootBundle.loadString('welcome.note');
      final doc = NotusDocument.fromJson(jsonDecode(result));
      setState(() {
        _controller = ZefyrController(doc);
      });
    } catch (error) {
      final doc = NotusDocument()..insert(0, 'Empty asset');
      setState(() {
        _controller = ZefyrController(doc);
      });
    }
  }

  Future<void> _save() async {
    final fs = LocalFileSystem();
    final file = fs.directory(_settings!.assetsPath).childFile('welcome.note');
    final data = jsonEncode(_controller.document);
    await file.writeAsString(data);
  }

  void _launchUrl(String url) async {
    final result = await canLaunch(url);
    if (result) {
      await launch(url);
    }
  }
}
