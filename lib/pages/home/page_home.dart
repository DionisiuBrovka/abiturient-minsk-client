import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          customTitle: const Text("Главная страница"),
        ),
        body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
          if (state is NetworkSuccess) {
            return const Center(child: Text("Connected sucsess"));
          } else {
            return const NoNetworkPlaceholder();
          }
        }),
        drawer: const CustomDrawer(
          selectedIndex: 0,
        ));
  }
}
