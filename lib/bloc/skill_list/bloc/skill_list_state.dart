part of 'skill_list_bloc.dart';

@immutable
sealed class SkillListState {}

final class SkillListInitialState extends SkillListState {}

final class SkillListLoadingState extends SkillListState {}

final class SkillListSucsessState extends SkillListState {
  final List<SkillModel> skillsList;

  SkillListSucsessState({required this.skillsList});
}

final class SkillListErrorState extends SkillListState {}
