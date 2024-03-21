part of 'skill_list_bloc.dart';

@immutable
sealed class SkillListEvent {}

class LoadSkillListEvent extends SkillListEvent {}

class FilterCTypeSSOSkillListEvent extends SkillListEvent {
  final List<SkillModel> skillsList;

  FilterCTypeSSOSkillListEvent(this.skillsList);
}

class FilterCTypePTOSkillListEvent extends SkillListEvent {
  final List<SkillModel> skillsList;

  FilterCTypePTOSkillListEvent(this.skillsList);
}

class FilterCTypeAllSkillListEvent extends SkillListEvent {
  final List<SkillModel> skillsList;

  FilterCTypeAllSkillListEvent(this.skillsList);
}

class FilterTitleSkillListEvent extends SkillListEvent {
  final List<SkillModel> skillsList;
  final String query;

  FilterTitleSkillListEvent(this.skillsList, this.query);
}
