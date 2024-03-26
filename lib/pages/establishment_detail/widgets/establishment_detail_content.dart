import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/bloc/establishment_detail/bloc/establishment_detail_bloc.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishment_detail_contacts.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishment_detail_map.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishment_detail_svod_table.dart';

class EstablishmentDetailContent extends StatelessWidget {
  final EstablishmentDetailSucsesState state;

  const EstablishmentDetailContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1000,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Divider(),
              EstablishmentDetailSvodTable(
                svodTable: state.establishment.svodSkillsList!,
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
    );
  }
}
