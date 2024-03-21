import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';

class SkillListSearchBar extends StatefulWidget {
  const SkillListSearchBar({super.key});

  @override
  State<SkillListSearchBar> createState() => _SkillListSearchBarState();
}

class _SkillListSearchBarState extends State<SkillListSearchBar> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillListBloc, SkillListState>(
      builder: (context, state) {
        if (state is SkillListSucsessState) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: queryController,
              onChanged: (value) {
                context.read<SkillListBloc>().add(FilterTitleSkillListEvent(
                    state.skillsList, queryController.text));
              },
              decoration: const InputDecoration(
                  labelText: "Поиск",
                  suffixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder()),
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
