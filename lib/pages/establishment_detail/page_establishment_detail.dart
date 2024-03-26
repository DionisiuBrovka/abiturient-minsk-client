import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_eduapp_new/bloc/establishment_detail/bloc/establishment_detail_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishment_detail_content.dart';
import 'package:flutter_eduapp_new/pages/establishment_detail/widgets/establishment_detail_title.dart';
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
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      EstablishmentDetailTitle(
                        establishment: state.establishment,
                      ),
                      EstablishmentDetailContent(
                        state: state,
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
