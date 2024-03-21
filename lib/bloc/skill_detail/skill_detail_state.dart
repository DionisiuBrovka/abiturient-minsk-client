part of 'skill_detail_bloc.dart';

@immutable
sealed class SkillDetailState {}

final class SkillDetailInitialState extends SkillDetailState {}

final class SkillDetailLoadingState extends SkillDetailState {}

final class SkillDetailSucsessState extends SkillDetailState {
  final SkillModel skill;

  SkillDetailSucsessState({required this.skill});
}

final class SkillDetailErrorState extends SkillDetailState {}
