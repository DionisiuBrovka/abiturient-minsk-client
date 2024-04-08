import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PageHomeBanners extends StatelessWidget {
  const PageHomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Другие ресурсы:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () => launchUrlString("http://edu.gov.by/"),
                child: Image.asset(
                  "assets/baner_1.png",
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () => launchUrlString("https://minsk.gov.by/ru/"),
                child: Image.asset(
                  "assets/baner_2.png",
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () => launchUrlString("http://minsk.edu.by/"),
                child: Image.asset(
                  "assets/baner_3.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
