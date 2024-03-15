// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/data/repositories/skill_repository.dart';
import 'package:meta/meta.dart';

part 'skill_list_event.dart';
part 'skill_list_state.dart';

class SkillListBloc extends Bloc<SkillListEvent, SkillListState> {
  SkillListBloc() : super(SkillListInitialState()) {
    on<SkillListEvent>((event, emit) {
      log("flutter: SkillListBloc Event ${event.toString()}");
    });

    on<LoadSkillListEvent>((event, emit) async {
      emit(SkillListLoadingState());
      try {
        emit(SkillListSucsessState(
            skillsList: await SkillRepository.getSkillList()));
      } catch (e) {
        log(e.toString());
        emit(SkillListErrorState());
      }
    });
  }
}
