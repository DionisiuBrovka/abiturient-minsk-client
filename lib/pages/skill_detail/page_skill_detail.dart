import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/bloc/skill_detail/bloc/skill_detail_bloc.dart';
import 'package:flutter_eduapp_new/pages/skill_detail/widgets/skill_detail_content.dart';
import 'package:flutter_eduapp_new/pages/skill_detail/widgets/skill_detail_title.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';

class PageSkillDetail extends StatelessWidget {
  final int id;

  const PageSkillDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("Специальность"),
      ),
      body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
        if (state is NetworkSuccess) {
          return BlocProvider<SkillDetailBloc>(
            create: (context) =>
                SkillDetailBloc()..add(LoadSkillDetailEvent(id)),
            child: BlocBuilder<SkillDetailBloc, SkillDetailState>(
                builder: (context, state) {
              if (state is SkillDetailLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SkillDetailSucsessState) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    SkillDetailTitle(
                      skill: state.skill,
                    ),
                    SkillDetailContent(
                      skill: state.skill,
                    ),
                  ],
                );
              } else {
                return const Text("ERROR");
              }
            }),
          );
        } else {
          return const NoNetworkPlaceholder();
        }
      }),
    );
  }
}
