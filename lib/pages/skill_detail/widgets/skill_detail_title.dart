import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/utils/network_image_error_builder.dart';

class SkillDetailTitle extends StatelessWidget {
  final SkillModel skill;

  const SkillDetailTitle({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/fon_main_clean.png",
          fit: BoxFit.cover,
          height: 150,
          width: double.infinity,
        ),
        SizedBox(
          width: 800,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                skill.photo ?? "",
                width: 800,
                height: 600,
                fit: BoxFit.cover,
                errorBuilder: NetworkImageErrorBuilder,
              )
            ],
          ),
        )
      ],
    );
  }
}
