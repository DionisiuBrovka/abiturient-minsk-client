// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'establishment_list_event.dart';
part 'establishment_list_state.dart';

class EstablishmentListBloc
    extends Bloc<EstablishmentListEvent, EstablishmentListState> {
  EstablishmentListBloc() : super(EstablishmentListInitialState()) {
    on<EstablishmentListEvent>((event, emit) {
      log("flutter: EstablishmentListBloc Event ${event.toString()}");
    });
  }
}
