import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/pages/establishment_list/widgets/establishments_list_adapter.dart';

class EstablishmentListViewholder extends StatelessWidget {
  const EstablishmentListViewholder({super.key, required this.establishments});

  final List<EstablishmentModel> establishments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: establishments.length,
        itemBuilder: (context, index) {
          return EstablishmentListAdapter(establishment: establishments[index]);
        });
  }
}
