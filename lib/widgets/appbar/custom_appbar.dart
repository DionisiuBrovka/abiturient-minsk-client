import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {

  final Widget? customTitle;

  @override
  CustomAppBar({super.key, this.customTitle}):super(
    title: customTitle,
    backgroundColor: const Color.fromARGB(255, 0, 110, 255),
    foregroundColor: Colors.white,
  );
}