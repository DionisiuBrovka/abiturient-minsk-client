import 'package:flutter/material.dart';

class SkillListSearchBar extends StatelessWidget {
  const SkillListSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: "Поиск",
            suffixIcon: Icon(Icons.search),
            border: UnderlineInputBorder()),
      ),
    );
  }
}
