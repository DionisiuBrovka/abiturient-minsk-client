import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

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
                    initialZoom: 15,
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
