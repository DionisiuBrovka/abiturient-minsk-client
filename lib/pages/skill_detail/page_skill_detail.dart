import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/bloc/skill_detail/skill_detail_bloc.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

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
              child: Center(
                child: BlocBuilder<SkillDetailBloc, SkillDetailState>(
                    builder: (context, state) {
                  if (state is SkillDetailLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is SkillDetailSucsessState) {
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    );
                  } else {
                    return const Text("ERROR");
                  }
                }),
              ),
            );
          } else {
            return const NoNetworkPlaceholder();
          }
        }),
        drawer: const CustomDrawer(
          selectedIndex: 2,
        ));
  }
}
