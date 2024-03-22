import 'package:flutter/material.dart';

class PageHomeFunctionalytiHelper extends StatelessWidget {
  const PageHomeFunctionalytiHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Мы поможем вам:",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
        const Placeholder(
          child: Text("Активные кнопочки"),
        ),
      ],
    );
  }
}
