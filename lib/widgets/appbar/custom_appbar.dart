import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final Widget? customTitle;

  @override
  CustomAppBar({super.key, this.customTitle})
      : super(
          title: customTitle,
          backgroundColor: const Color.fromARGB(255, 41, 83, 199),
          foregroundColor: Colors.white,
          // leading: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Center(
          //     child: IconButton.filled(
          //       onPressed: () {},
          //       icon: const Icon(Icons.menu),
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        );
}
