import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';

class SkillListAdapter extends StatelessWidget {
  const SkillListAdapter({
    super.key,
    required this.skill,
  });

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 3,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          hoverColor: const Color.fromARGB(255, 139, 185, 255),
          focusColor: const Color.fromARGB(255, 176, 207, 255),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        skill.specialty?.title ?? "---",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(skill.code ?? "---")
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
