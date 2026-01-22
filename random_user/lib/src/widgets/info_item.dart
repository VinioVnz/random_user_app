import 'package:flutter/material.dart';

class InfoItem {
  final IconData? icon;
  final String text;
  final String? hint;
  final String? flagCode;

  InfoItem({this.icon, required this.text, this.hint, this.flagCode});
}