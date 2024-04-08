// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/data/repositories/establishment_repository.dart';
import 'package:meta/meta.dart';

part 'establishment_list_event.dart';
part 'establishment_list_state.dart';

class EstablishmentListBloc
    extends Bloc<EstablishmentListEvent, EstablishmentListState> {
  EstablishmentListBloc() : super(EstablishmentListInitialState()) {
    on<EstablishmentListEvent>((event, emit) {
      log("flutter: EstablishmentListBloc Event ${event.toString()}");
    });

    on<LoadEstablishmentListEvent>((event, emit) async {
      emit(EstablishmentListLoadingState());
      try {
        List<EstablishmentModel> establishmentList =
            await EstablishmentRepository.getList();
        emit(EstablishmentListSucsessState(
            establishmentList: establishmentList,
            establishmentListFiltered: establishmentList));
      } catch (e) {
        log(e.toString());
        emit(EstablishmentListErrorState());
      }
    });

    on<FilterEstablishmentListEvent>((event, emit) {
      emit(EstablishmentListSucsessState(
          establishmentList: event.establishmentList,
          establishmentListFiltered: event.establishmentList
              .where((element) => element.title
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
              .toList()));
    });
  }
}
