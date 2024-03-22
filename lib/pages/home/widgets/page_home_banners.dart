import 'package:flutter/material.dart';

class PageHomeBanners extends StatelessWidget {
  const PageHomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Другие ресурсы:",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
        const Placeholder(
          child: Text("Банеры"),
        )
      ],
    );
  }
}
