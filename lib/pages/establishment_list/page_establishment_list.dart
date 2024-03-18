import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_list/bloc/establishment_list_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageEstablishmentList extends StatelessWidget {
  const PageEstablishmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          customTitle: const Text("Специальности"),
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
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text("ok")],
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
