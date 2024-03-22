part of 'skill_detail_bloc.dart';

@immutable
sealed class SkillDetailEvent {}

class LoadSkillDetailEvent extends SkillDetailEvent {
  final int id;

  LoadSkillDetailEvent(this.id);
}
