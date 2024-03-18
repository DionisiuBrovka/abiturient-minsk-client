import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';

class EstablishmentListAdapter extends StatelessWidget {
  const EstablishmentListAdapter({super.key, required this.establishment});

  final EstablishmentModel establishment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.home,
                size: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      establishment.title ?? "---",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(establishment.adress ?? "---")
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
