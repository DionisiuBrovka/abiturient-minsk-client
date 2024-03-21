part of 'skill_list_bloc.dart';

@immutable
sealed class SkillListState {}

final class SkillListInitialState extends SkillListState {}

final class SkillListLoadingState extends SkillListState {}

final class SkillListSucsessState extends SkillListState {
  final List<SkillModel> skillsList;
  final List<SkillModel> skillsListFiltered;

  SkillListSucsessState(
      {required this.skillsList, required this.skillsListFiltered});
}

final class SkillListErrorState extends SkillListState {}
