import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Мы поможем вам:",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              FunctionalityCard(
                icon: Icons.account_balance,
                title: "Выбрать колледж",
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageEstablishmentList(),
                      ));
                },
              ),
              FunctionalityCard(
                icon: Icons.person,
                title: "Выбрать специальность",
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageSkillList(),
                      ));
                },
              ),
              FunctionalityCard(
                icon: Icons.description_rounded,
                title: "Узнать график работы приемной комисии",
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageDocumentSchedule(),
                      ));
                },
              ),
              FunctionalityCard(
                icon: Icons.description_rounded,
                title: "Какие документы нужны для поступления",
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageDocumentList(),
                      ));
                },
              ),
              FunctionalityCard(
                icon: Icons.checklist,
                title: "Пройти тест на профорьентацию",
                function: () {
                  launchUrl(Uri.parse('https://profitest.ripo.by/public/main'));
                },
              ),
              FunctionalityCard(
                icon: Icons.question_answer,
                title: "Или задать интересующий вас вопрос",
                function: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageFAQ(),
                      ));
                },
              ),

              // ------------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}

class FunctionalityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() function;
  const FunctionalityCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: function,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 90,
            width: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
