import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/bloc/skill_list/bloc/skill_list_bloc.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_filter.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_search_bar.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_viewholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageSkillList extends StatelessWidget {
  const PageSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    log("-----==#[ BUILD PAGE - (page_skill_list) ]#==------");
    FirebaseAnalytics.instance.logScreenView(
        screenClass: "page_class_functional",
        screenName: "page_skill_list",
        parameters: {"page_title": "Список квалификаций"});
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
                        // Image.asset(
                        //   "assets/fon.jpg",
                        //   fit: BoxFit.cover,
                        //   height: 150,
                        //   width: double.infinity,
                        // ),
                        Expanded(
                          child: SizedBox(
                            width: 1000,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SkillListSearchBar(),
                                const SkillListFilter(),
                                Expanded(
                                  child: SkillListViewholder(
                                    skills: state.skillsListFiltered,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
