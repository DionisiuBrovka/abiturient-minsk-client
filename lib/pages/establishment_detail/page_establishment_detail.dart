import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_detail/bloc/establishment_detail_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
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
                      const Expanded(
                        child: SizedBox(
                          width: 1000,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [],
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
