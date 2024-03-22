import 'package:flutter/material.dart';

class PageHomePlatformSelect extends StatelessWidget {
  const PageHomePlatformSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Так же наше приложение доступно на разных платформах:",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
        const Placeholder(
          child: Text("Ссылки на другие платформы"),
        ),
      ],
    );
  }
}
