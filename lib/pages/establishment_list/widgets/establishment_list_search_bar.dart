import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eduapp_new/bloc/establishment_list/bloc/establishment_list_bloc.dart';

class EstablishmentListSearchBar extends StatefulWidget {
  const EstablishmentListSearchBar({super.key});

  @override
  State<EstablishmentListSearchBar> createState() =>
      _EstablishmentListSearchBarState();
}

class _EstablishmentListSearchBarState
    extends State<EstablishmentListSearchBar> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstablishmentListBloc, EstablishmentListState>(
      builder: (context, state) {
        if (state is EstablishmentListSucsessState) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: queryController,
              onChanged: (value) => context.read<EstablishmentListBloc>().add(
                  FilterEstablishmentListEvent(
                      state.establishmentList, queryController.text)),
              decoration: const InputDecoration(
                  labelText: "Поиск",
                  suffixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder()),
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}
