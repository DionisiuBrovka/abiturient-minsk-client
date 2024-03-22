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
        List<SkillModel> skillsList = await SkillRepository.getList();
        skillsList.sort((a, b) => a.code!.compareTo(b.code!));
        emit(SkillListSucsessState(
            skillsList: skillsList, skillsListFiltered: skillsList));
      } catch (e) {
        log(e.toString());
        emit(SkillListErrorState());
      }
    });

    on<FilterCTypeSSOSkillListEvent>((event, emit) async {
      emit(SkillListSucsessState(
          skillsList: event.skillsList,
          skillsListFiltered: event.skillsList.where((element) {
            if (element.specialty?.cType == "ССО") {
              return true;
            } else {
              return false;
            }
          }).toList()));
    });

    on<FilterCTypePTOSkillListEvent>((event, emit) async {
      emit(SkillListSucsessState(
          skillsList: event.skillsList,
          skillsListFiltered: event.skillsList.where((element) {
            if (element.specialty?.cType == "ПТО") {
              return true;
            } else {
              return false;
            }
          }).toList()));
    });

    on<FilterCTypeAllSkillListEvent>((event, emit) async {
      emit(SkillListSucsessState(
        skillsList: event.skillsList,
        skillsListFiltered: event.skillsList,
      ));
    });

    on<FilterTitleSkillListEvent>((event, emit) {
      emit(SkillListSucsessState(
        skillsList: event.skillsList,
        skillsListFiltered: event.skillsList
            .where((element) => "${element.title} ${element.searchtag}"
                .toLowerCase()
                .contains(event.query.toLowerCase()))
            .toList(),
      ));
    });
  }
}
