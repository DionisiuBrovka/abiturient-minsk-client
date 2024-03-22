import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:flutter_eduapp_new/data/repositories/establishment_repository.dart';
import 'package:meta/meta.dart';

part 'establishment_detail_event.dart';
part 'establishment_detail_state.dart';

class EstablishmentDetailBloc
    extends Bloc<EstablishmentDetailEvent, EstablishmentDetailState> {
  EstablishmentDetailBloc() : super(EstablishmentDetailInitialState()) {
    on<EstablishmentDetailEvent>((event, emit) {
      log("flutter: EstablishmentDetailBloc Event ${event.toString()}");
    });

    on<LoadEstablishmentDetailEvent>((event, emit) async {
      emit(EstablishmentDetailLoadingState());
      try {
        EstablishmentModel? establishment =
            await EstablishmentRepository.getObject(event.id);

        if (establishment != null) {
          emit(EstablishmentDetailSucsesState(establishment: establishment));
        } else {
          throw 'Empty establishment';
        }
      } catch (e) {
        log(e.toString());
        emit(EstablishmentDetailErrorState());
      }
    });
  }
}
