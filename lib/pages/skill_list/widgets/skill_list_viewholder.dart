import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_adapter.dart';

class SkillListViewholder extends StatelessWidget {
  const SkillListViewholder({super.key, required this.skills});

  final List<SkillModel> skills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return SkillListAdapter(skill: skills[index]);
          }),
    );
  }
}
