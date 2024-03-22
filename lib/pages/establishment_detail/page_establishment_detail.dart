import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_detail/bloc/establishment_detail_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_adapter.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';

class PageEstablishmentDetail extends StatelessWidget {
  final int id;

  const PageEstablishmentDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: Text("Учреждение образования #$id"),
      ),
      body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
        if (state is NetworkSuccess) {
          return BlocProvider<EstablishmentDetailBloc>(
            create: (context) => EstablishmentDetailBloc()
              ..add(LoadEstablishmentDetailEvent(id)),
            child: Center(
              child: BlocBuilder<EstablishmentDetailBloc,
                  EstablishmentDetailState>(builder: (context, state) {
                if (state is EstablishmentDetailLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is EstablishmentDetailSucsesState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/fon_alt.jpg",
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 1000,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Stack(alignment: Alignment.topLeft, children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        state.establishment.title ?? "---",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ],
                                  ),
                                  Image.network(
                                    state.establishment.icon ?? "",
                                    width: 100,
                                    height: 100,
                                  )
                                ]),
                                const Divider(),
                                Text(
                                  "Данные колледжа",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Divider(),
                                const Placeholder(
                                  fallbackWidth: 300,
                                  fallbackHeight: 300,
                                ),
                                Text(
                                  "План набора на 2024/2025",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Divider(),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        state.establishment.skillsList!.length,
                                    itemBuilder: (context, index) {
                                      return SkillListAdapter(
                                          skill: state.establishment
                                              .skillsList![index]);
                                    }),
                                Text(
                                  "Мы на карте",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Divider(),
                                const Placeholder(
                                  fallbackWidth: 300,
                                  fallbackHeight: 300,
                                ),
                                Text(
                                  "Контакты",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Divider(),
                                const Placeholder(
                                  fallbackWidth: 300,
                                  fallbackHeight: 300,
                                )
                              ],
                            ),
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
    );
  }
}
