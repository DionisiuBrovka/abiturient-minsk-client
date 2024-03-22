import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageHomePlatformSelect extends StatelessWidget {
  const PageHomePlatformSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Так же наше приложение доступно на разных платформах:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.language),
                  label: const Text("Веб-версия")),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.windows),
                  label: const Text("Windows .x32-64")),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.android),
                  label: const Text("Android")),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.appStoreIos),
                  label: const Text("IOS")),
            ],
          ),
        ],
      ),
    );
  }
}
