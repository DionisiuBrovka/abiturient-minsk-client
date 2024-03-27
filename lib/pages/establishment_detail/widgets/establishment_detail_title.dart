import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/utils/network_image_error_builder.dart';

class EstablishmentDetailTitle extends StatelessWidget {
  final EstablishmentModel establishment;

  const EstablishmentDetailTitle({super.key, required this.establishment});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
      Image.asset(
        "assets/fon_main_clean.png",
        fit: BoxFit.cover,
        height: 150,
        width: double.infinity,
      ),
      Center(
        child: SizedBox(
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
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
                          fit: BoxFit.cover,
                          errorBuilder: NetworkImageErrorBuilder,
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
                      establishment.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
