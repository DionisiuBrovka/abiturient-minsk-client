import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/pages/skill_detail/page_skill_detail.dart';

class SkillListAdapter extends StatelessWidget {
  const SkillListAdapter({
    super.key,
    required this.skill,
  });

  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 10),
      child: Card(
        elevation: 3,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          hoverColor: const Color.fromARGB(255, 207, 226, 255),
          focusColor: const Color.fromARGB(255, 176, 207, 255),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PageSkillDetail(
                    id: skill.id,
                  ))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  skill.specialty.icon ?? "👩‍🔧",
                  style: const TextStyle(fontSize: 50),
                ),
                // Image.network(
                //     "https://emoji.aranja.com/static/emoji-data/img-apple-160/1f469-200d-1f33e.png"),
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
                        skill.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Divider(),
                      Text(
                        skill.specialty.title,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(skill.code)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
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
