import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

import 'widgets/page_home_banners.dart';
import 'widgets/page_home_description.dart';
import 'widgets/page_home_functionalyti_helper.dart';
import 'widgets/page_home_platform_select.dart';

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
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/fon_main.png",
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
                Expanded(
                  child: SizedBox(
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: const [
                          PageHomeDescription(),
                          PageHomeFunctionalytiHelper(),
                          PageHomePlatformSelect(),
                          PageHomeBanners()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const NoNetworkPlaceholder();
          }
        }),
        drawer: const CustomDrawer(
          selectedIndex: 0,
        ));
  }
}
