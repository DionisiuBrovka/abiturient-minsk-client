import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_adapter.dart';

class SkillListViewholder extends StatelessWidget {
  const SkillListViewholder({super.key, required this.state});

  final SkillListSucsessState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: state.skillsList.length,
          itemBuilder: (context, index) {
            return SkillListAdapter(skill: state.skillsList[index]);
          }),
    );
  }
}
