import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_viewholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageSkillList extends StatelessWidget {
  const PageSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          customTitle: const Text("Специальности"),
        ),
        body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
          if (state is NetworkSuccess) {
            return BlocProvider<SkillListBloc>(
              create: (context) => SkillListBloc()..add(LoadSkillListEvent()),
              child: Center(
                child: BlocBuilder<SkillListBloc, SkillListState>(
                    builder: (context, state) {
                  if (state is SkillListLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is SkillListSucsessState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Placeholder(
                          fallbackHeight: 150,
                        ),
                        Expanded(
                          child: ListView(shrinkWrap: true, children: [
                            SkillListViewholder(
                              state: state,
                            )
                          ]),
                        ),
                      ],
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
