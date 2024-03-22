import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/page_establishment_list.dart';
import 'package:flutter_eduapp_new/pages/home/page_home.dart';
import 'package:flutter_eduapp_new/pages/skill_list/page_skill_list.dart';

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
            icon: Icon(Icons.account_balance),
            label: Text("Учреждения образования")),
        NavigationDrawerDestination(
            icon: Icon(Icons.person), label: Text("Специальности")),
        // NavigationDrawerDestination(
        //     icon: Icon(Icons.calendar_month), label: Text("Мероприятия")),
        Divider(),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("Правила приема")),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("Список документов")),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
            label: Text("Сроки подачи документов")),
        NavigationDrawerDestination(
            icon: Icon(Icons.description_rounded),
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
