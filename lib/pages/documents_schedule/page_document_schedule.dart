import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/documents_schedule/schedule_markdown_data.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PageDocumentSchedule extends StatelessWidget {
  const PageDocumentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    log("-----==#[ BUILD PAGE - (page_document_schedule) ]#==------");
    FirebaseAnalytics.instance.logScreenView(
        screenClass: "page_class_documents",
        screenName: "page_document_schedule",
        parameters: {"page_title": "Графики работы комисии"});
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("График работы комисии"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/faq-shudle.jpg",
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
                  data: SCHEDULE_MARKDOWN_DATA,
                  selectable: false,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(
        selectedIndex: 3,
      ),
    );
  }
}
