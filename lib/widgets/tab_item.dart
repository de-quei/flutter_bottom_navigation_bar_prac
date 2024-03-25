import 'package:flutter/material.dart';

class TabItem {
  late String _title; //late 키워드로 나중에 초기화할 수 있도록 함.
  late IconData _icon;

  TabItem(String title, IconData icon) {
    _title = title;
    _icon = icon;
  }

  String getTitle() => _title;
  IconData getIcon() => _icon;
}
