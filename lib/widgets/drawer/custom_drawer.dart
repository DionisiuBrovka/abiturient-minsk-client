import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/documents_deadline/page_document_deadline.dart';
import 'package:flutter_eduapp_new/pages/documents_list/page_document_list.dart';
import 'package:flutter_eduapp_new/pages/documents_schedule/page_document_schedule.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/page_establishment_list.dart';
import 'package:flutter_eduapp_new/pages/faq/page_faq.dart';
import 'package:flutter_eduapp_new/pages/home/page_home.dart';
import 'package:flutter_eduapp_new/pages/skill_list/page_skill_list.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int selected) {
        switch (selected) {
          case 0:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageHome(),
                ));
            break;
          case 1:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageEstablishmentList(),
                ));
            break;
          case 2:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageSkillList(),
                ));
            break;

          case 3:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageDocumentSchedule(),
                ));
            break;

          case 4:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageDocumentList(),
                ));
            break;

          case 5:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageDocumentDeadline(),
                ));
            break;

          case 6:
            launchUrl(Uri.parse('https://profitest.ripo.by/public/main'));
            break;

          case 7:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageFAQ(),
                ));
            break;

          case 8:
            showAboutDialog(
                context: context,
                applicationName: "Абитуриент Минск",
                applicationVersion: "0.2.0a",
                applicationIcon: Image.asset(
                  "assets/icon/icon.png",
                  width: 55,
                  height: 55,
                ),
                children: [
                  const Divider(),
                  const Text(
                      "Приложение разработано для Минского коммитета по образованию."),
                  const Text("Разработал Бровка Д.С."),
                  //TODO
                ]);

            break;
          // case 3:
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const PageEventList(),
          //       ));
          //   break;
          default:
        }
      },
      children: const [
        UserAccountsDrawerHeader(
          accountName: Text("Абитуриент МИНСК"),
          accountEmail: Text("приложения для помощи выбора будущего"),
        ),
        NavigationDrawerDestination(
            icon: Icon(Icons.home), label: Text("Главная")),
        NavigationDrawerDestination(
            icon: Icon(Icons.account_balance), label: Text("Колледжи")),
        NavigationDrawerDestination(
            icon: Icon(Icons.person), label: Text("Специальности")),
        // NavigationDrawerDestination(
        //     icon: Icon(Icons.calendar_month), label: Text("Мероприятия")),
        Divider(),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("График работы комисии")),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("Документы для поступления")),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("Сроки подачи документов")),
        NavigationDrawerDestination(
            icon: Icon(Icons.checklist),
            label: Text("Профориентационный тест")),
        Divider(),
        NavigationDrawerDestination(
            icon: Icon(Icons.question_answer), label: Text("Вопрос ответ")),
        NavigationDrawerDestination(
            icon: Icon(Icons.info_outline), label: Text("О приложении")),
      ],
    );
  }
}
