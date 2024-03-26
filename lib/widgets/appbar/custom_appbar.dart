import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget? customTitle;

  @override
  CustomAppBar({super.key, this.customTitle})
      : super(
          title: customTitle,
          backgroundColor: const Color.fromARGB(255, 41, 83, 199),
          foregroundColor: Colors.white,
        );
}
