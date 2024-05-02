import 'package:flutter/material.dart';

Widget buildSettingsTile({
  required Widget leading,
  required String title,
  required Widget trailing,
}) {
  return ListTile(
    leading: CircleAvatar(child: leading),
    title: Text(title),
    trailing: trailing,
  );
}