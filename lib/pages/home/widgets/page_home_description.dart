import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/home/widgets/markdown_data.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PageHomeDescription extends StatelessWidget {
  const PageHomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MarkdownBody(data: HOME_MARKDOWN_DATA),
    );
  }
}
