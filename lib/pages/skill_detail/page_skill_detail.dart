import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/bloc/network_bloc.dart';
import 'package:flutter_eduapp_new/bloc/internet/no_network_placeholder.dart';
import 'package:flutter_eduapp_new/bloc/skill_detail/bloc/skill_detail_bloc.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';

class PageSkillDetail extends StatelessWidget {
  final int id;

  const PageSkillDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("Специальность"),
      ),
      body: BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
        if (state is NetworkSuccess) {
          return BlocProvider<SkillDetailBloc>(
            create: (context) =>
                SkillDetailBloc()..add(LoadSkillDetailEvent(id)),
            child: Center(
              child: BlocBuilder<SkillDetailBloc, SkillDetailState>(
                  builder: (context, state) {
                if (state is SkillDetailLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is SkillDetailSucsessState) {
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
