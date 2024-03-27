import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SkillDetailContent extends StatelessWidget {
  final SkillModel skill;

  const SkillDetailContent({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    var markdownStyleSheet = MarkdownStyleSheet(
      textAlign: WrapAlignment.spaceBetween,
      orderedListAlign: WrapAlignment.spaceBetween,
      unorderedListAlign: WrapAlignment.spaceBetween,
      p: const TextStyle(fontSize: 16),
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          width: 800,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                skill.code,
                style: const TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                    height: 0.8,
                    color: Color.fromARGB(255, 0, 21, 90)),
              ),
              Text(
                skill.title,
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 51, 78, 165)),
              ),
              const Divider(),
              MarkdownBody(
                data: skill.desc ?? "",
                styleSheet: markdownStyleSheet,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Вы получите навыки по:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              MarkdownBody(
                data: skill.descHardskills ?? "",
                styleSheet: markdownStyleSheet,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Кем вы можете работать:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              MarkdownBody(
                data: skill.descWork ?? "",
                styleSheet: markdownStyleSheet,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Мы поможем вам развить следующие компетенции:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              MarkdownBody(
                data: skill.descSoftskills ?? "",
                styleSheet: markdownStyleSheet,
              ),
              const SizedBox(
                height: 20,
              ),
              // EstablishmentListViewholder(establishments: skill.),
              Text(
                "Где вы можете получить проффесию:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
