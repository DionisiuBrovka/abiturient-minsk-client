import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';

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
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                  elevation: 3,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              state.skillsList[index].specialty?.title ?? "",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
