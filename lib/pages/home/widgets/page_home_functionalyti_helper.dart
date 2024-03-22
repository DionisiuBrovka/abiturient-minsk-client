import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/documents_deadline/page_document_deadline.dart';
import 'package:flutter_eduapp_new/pages/documents_list/page_document_list.dart';
import 'package:flutter_eduapp_new/pages/documents_schedule/page_document_schedule.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/page_establishment_list.dart';
import 'package:flutter_eduapp_new/pages/faq/page_faq.dart';
import 'package:flutter_eduapp_new/pages/skill_list/page_skill_list.dart';
import 'package:url_launcher/url_launcher.dart';

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
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageEstablishmentList(),
                      ));
                },
                icon: const Icon(Icons.account_balance),
                label: const Text("Выбрать колледж")),
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageSkillList(),
                      ));
                },
                icon: const Icon(Icons.person),
                label: const Text("Выбрать специальность")),
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageDocumentSchedule(),
                      ));
                },
                icon: const Icon(Icons.description_rounded),
                label: const Text("Узнать график работы приемной комисии")),
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageDocumentList(),
                      ));
                },
                icon: const Icon(Icons.description_rounded),
                label: const Text("Какие документы нужны для поступления")),
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageDocumentDeadline(),
                      ));
                },
                icon: const Icon(Icons.description_rounded),
                label: const Text("Когда нужно подовать документы")),
            FilledButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse('https://profitest.ripo.by/public/main'));
                },
                icon: const Icon(Icons.checklist),
                label: const Text("Пройти тест на профорьентацию")),
            FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageFAQ(),
                      ));
                },
                icon: const Icon(Icons.question_answer),
                label: const Text("Или задать интересующий вас вопрос")),
          ],
        ),
      ],
    );
  }
}
