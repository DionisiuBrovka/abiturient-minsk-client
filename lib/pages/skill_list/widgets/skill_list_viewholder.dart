import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_adapter.dart';

class SkillListViewholder extends StatelessWidget {
  const SkillListViewholder({super.key, required this.skills});

  final List<SkillModel> skills;

  @override
  Widget build(BuildContext context) {
    if (skills.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillListAdapter(skill: skills[index]);
            }),
      );
    } else {
      return const SearchError();
    }
  }
}

class SearchError extends StatelessWidget {
  const SearchError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 80,
                color: Theme.of(context).disabledColor,
              ),
              Text(
                "Упс, что то пошло не так ...",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Мы не смогли найти специальностей по вашему запросу",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).disabledColor),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
