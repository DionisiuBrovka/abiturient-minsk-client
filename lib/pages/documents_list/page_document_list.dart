import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/documents_list/list_markdown_data.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PageDocumentList extends StatelessWidget {
  const PageDocumentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("Список документов"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/faq-docs.jpg",
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 1000,
                child: MarkdownBody(
                  data: LIST_MARKDOWN_DATA,
                  selectable: false,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(
        selectedIndex: 4,
      ),
    );
  }
}
