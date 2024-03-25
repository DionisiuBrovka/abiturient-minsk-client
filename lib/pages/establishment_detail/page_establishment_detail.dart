import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_detail/bloc/establishment_detail_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/data/models/svod_table_model.dart';
import 'package:flutter_eduapp_new/pages/skill_list/widgets/skill_list_adapter.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';

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
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      EstablishmentDetailTitle(
                        establishment: state.establishment,
                      ),
                      Center(
                        child: SizedBox(
                          width: 1000,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Divider(),
                                EstablishmentDetailSvodTable(
                                  svodTable:
                                      state.establishment.svodSkillsList!,
                                ),
                                EstablishmentDetailMap(
                                  establishment: state.establishment,
                                ),
                                EstablishmentDetailContacts(
                                  establishment: state.establishment,
                                ),
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

class EstablishmentDetailTitle extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmentDetailTitle({super.key, required this.establishment});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
      Image.asset(
        "assets/fon_alt.jpg",
        fit: BoxFit.cover,
        height: 150,
        width: double.infinity,
      ),
      Center(
        child: SizedBox(
          width: 1000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(126, 0, 0, 0),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 1.1,
                      child: Image.network(
                        establishment.icon ?? "",
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Text(
                    establishment.title ?? "---",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class EstablishmentDetailSvodTable extends StatelessWidget {
  final List<SvodTableModel> svodTable;

  const EstablishmentDetailSvodTable({super.key, required this.svodTable});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "План набора на 2024/2025",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: svodTable.map((e) {
            return SkillListAdapter(skill: e.skill!.first);
          }).toList(),
        ),
      ],
    );
  }
}

class EstablishmentDetailMap extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmentDetailMap({super.key, required this.establishment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Мы на карте",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          SizedBox(
              height: 400,
              child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(
                        double.parse(establishment.coords!.split(', ')[0]),
                        double.parse(establishment.coords!.split(', ')[1])),
                    initialZoom: 13,
                    cameraConstraint: CameraConstraint.contain(
                      bounds: LatLngBounds(
                        const LatLng(-90, -180),
                        const LatLng(90, 180),
                      ),
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                      tileProvider: CancellableNetworkTileProvider(),
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        width: 45,
                        height: 45,
                        point: LatLng(
                            double.parse(establishment.coords!.split(', ')[0]),
                            double.parse(establishment.coords!.split(', ')[1])),
                        child: IconButton(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          iconSize: 45,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.place,
                            color: Color.fromARGB(255, 63, 137, 255),
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 5)
                            ],
                          ),
                        ),
                      )
                    ]),
                  ]))
        ],
      ),
    );
  }
}

class EstablishmentDetailContacts extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmentDetailContacts({super.key, required this.establishment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Контакты",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 16,
            runSpacing: 16,
            children: [
              establishment.tel != null
                  ? Contact(
                      icon: Icons.phone,
                      title: "Телефон",
                      uri: Uri.parse(
                        "tel:${establishment.tel!}",
                      ))
                  : const Center(),
              establishment.email != null
                  ? Contact(
                      icon: Icons.email,
                      title: "Электронная почта",
                      uri: Uri.parse(
                        "mailto:${establishment.email!}",
                      ))
                  : const Center(),
              establishment.wsite != null
                  ? Contact(
                      icon: Icons.north_east,
                      title: "Веб-сайт",
                      uri: Uri.parse(
                        establishment.wsite!,
                      ))
                  : const Center(),
              establishment.wtel != null
                  ? Contact(
                      icon: Icons.telegram_outlined,
                      title: "Телеграмм",
                      uri: Uri.parse(
                        establishment.wtel!,
                      ))
                  : const Center(),
              establishment.wvk != null
                  ? Contact(
                      icon: FontAwesomeIcons.vk,
                      title: "Вконтакте",
                      uri: Uri.parse(
                        establishment.wvk!,
                      ))
                  : const Center(),
              establishment.winsta != null
                  ? Contact(
                      icon: FontAwesomeIcons.instagram,
                      title: "Инстаграм",
                      uri: Uri.parse(
                        establishment.winsta!,
                      ))
                  : const Center(),
              establishment.wface != null
                  ? Contact(
                      icon: FontAwesomeIcons.facebook,
                      title: "Фейсбук",
                      uri: Uri.parse(
                        establishment.wface!,
                      ))
                  : const Center(),
              establishment.wtwit != null
                  ? Contact(
                      icon: FontAwesomeIcons.xTwitter,
                      title: "Твиттер",
                      uri: Uri.parse(
                        establishment.wtwit!,
                      ))
                  : const Center(),
              establishment.wtic != null
                  ? Contact(
                      icon: FontAwesomeIcons.tiktok,
                      title: "Тик-ток",
                      uri: Uri.parse(
                        establishment.wtic!,
                      ))
                  : const Center(),
              establishment.wother != null
                  ? Contact(
                      icon: Icons.more_horiz,
                      title: "Другое",
                      uri: Uri.parse(
                        establishment.wother!,
                      ))
                  : const Center(),
            ],
          )
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  final IconData icon;
  final String title;
  final Uri uri;

  const Contact(
      {super.key, required this.icon, required this.title, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => launchUrl(uri),
        child: SizedBox(
          width: 220,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
