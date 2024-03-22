import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';

class SkillListFilter extends StatefulWidget {
  const SkillListFilter({super.key});

  @override
  State<SkillListFilter> createState() => _SkillListFilterState();
}

class _SkillListFilterState extends State<SkillListFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillListBloc, SkillListState>(
      builder: (context, state) {
        if (state is SkillListSucsessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text("Все"),
                  selected: 0 == selectedIndex,
                  onSelected: (value) => setState(() {
                    context
                        .read<SkillListBloc>()
                        .add(FilterCTypeAllSkillListEvent(state.skillsList));
                    selectedIndex = 0;
                  }),
                ),
                ChoiceChip(
                  label: const Text("ССО"),
                  selected: 1 == selectedIndex,
                  onSelected: (value) => setState(() {
                    context
                        .read<SkillListBloc>()
                        .add(FilterCTypeSSOSkillListEvent(state.skillsList));
                    selectedIndex = 1;
                  }),
                ),
                ChoiceChip(
                  label: const Text("ПТО"),
                  selected: 2 == selectedIndex,
                  onSelected: (value) => setState(() {
                    context
                        .read<SkillListBloc>()
                        .add(FilterCTypePTOSkillListEvent(state.skillsList));
                    selectedIndex = 2;
                  }),
                )
              ],
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
