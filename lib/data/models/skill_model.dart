import 'package:flutter_eduapp_new/data/models/specialty_model.dart';

class SkillModel {
  int id;
  SpecialtyModel specialty;
  String code;
  String title;
  String? searchtag;
  String? desc;
  String? photo;

  SkillModel(
      {required this.id,
      required this.specialty,
      required this.code,
      required this.title,
      this.searchtag,
      this.desc,
      this.photo});

  SkillModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        specialty = SpecialtyModel.fromJson(json['specialty']),
        code = json['code'],
        title = json['title'] {
    searchtag = json['searchtag'];
    desc = json['desc'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['specialty'] = specialty.toJson();
    data['code'] = code;
    data['title'] = title;
    data['searchtag'] = searchtag;
    data['desc'] = desc;
    data['photo'] = photo;
    return data;
  }
}
