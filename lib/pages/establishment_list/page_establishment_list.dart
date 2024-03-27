import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_list/bloc/establishment_list_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/widgets/establishment_list_search_bar.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/widgets/establishment_list_viewholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageEstablishmentList extends StatelessWidget {
  const PageEstablishmentList({super.key});

  @override
  Widget build(BuildContext context) {
    log("-----==#[ BUILD PAGE - (page_establishment_list) ]#==------");
    FirebaseAnalytics.instance.logScreenView(
        screenClass: "page_class_functional",
        screenName: "page_establishment_list",
        parameters: {"page_title": "Список колледжей"});
    return Scaffold(
        appBar: CustomAppBar(
          customTitle: const Text("Колледжи"),
        ),
        body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
          if (state is NetworkSuccess) {
            return BlocProvider<EstablishmentListBloc>(
              create: (context) =>
                  EstablishmentListBloc()..add(LoadEstablishmentListEvent()),
              child: Center(
                child:
                    BlocBuilder<EstablishmentListBloc, EstablishmentListState>(
                        builder: (context, state) {
                  if (state is EstablishmentListLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is EstablishmentListSucsessState) {
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
                              children: [
                                const EstablishmentListSearchBar(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: EstablishmentListViewholder(
                                        establishments:
                                            state.establishmentListFiltered),
                                  ),
                                )
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
          selectedIndex: 1,
        ));
  }
}
