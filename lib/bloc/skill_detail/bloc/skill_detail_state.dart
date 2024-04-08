part of 'skill_detail_bloc.dart';

@immutable
sealed class SkillDetailState {}

final class SkillDetailInitialState extends SkillDetailState {}

final class SkillDetailLoadingState extends SkillDetailState {}

final class SkillDetailSucsessState extends SkillDetailState {
  final SkillModel skill;
  final List<EstablishmentModel> establishmentsForSkill;

  SkillDetailSucsessState(
      {required this.skill, required this.establishmentsForSkill});
}

final class SkillDetailErrorState extends SkillDetailState {}
