import 'package:flutter/material.dart';

class AppBarItem {
  final Widget _widget;
  final String _title;

  AppBarItem(Widget widget, String title)
      : _widget = widget,
        _title = title;

  Widget get widget => _widget;
  String get title => _title;
}
