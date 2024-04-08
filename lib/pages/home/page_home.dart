import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/pages/home/widgets/page_home_banners.dart';
import 'package:flutter_eduapp_new/pages/home/widgets/page_home_platform_select.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';

import 'widgets/page_home_description.dart';
import 'widgets/page_home_functionalyti_helper.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    log("-----==#[ BUILD PAGE - (page_home) ]#==------");
    FirebaseAnalytics.instance.logScreenView(
        screenClass: "page_class_functional",
        screenName: "page_home",
        parameters: {"page_title": "Главная страница"});
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
                  height: 160,
                  width: double.infinity,
                ),
                Expanded(
                  child: SizedBox(
                    width: 1000,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        PageHomeDescription(),
                        PageHomeFunctionalytiHelper(),
                        PageHomeBanners(),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                    "Для корректной работы приложения, отключите блокировщик рекламы")
                              ],
                            ),
                          )),
                        ),
                        PageHomePlatformSelect(),
                      ],
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
