import 'package:flutter/material.dart';

Widget appBarCustom({List<Widget> actions, String title}) {
  return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 1,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      actions: actions);
}
