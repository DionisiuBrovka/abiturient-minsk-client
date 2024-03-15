import 'package:flutter_eduapp_new/data/models/group_model.dart';

class SpecialtyModel {
  int id;
  GroupModel? group;
  String? code;
  String? title;
  String? cType;
  String? prev;
  String? desc;
  String? icon;

  SpecialtyModel(
      {required this.id,
      this.group,
      this.code,
      this.title,
      this.cType,
      this.prev,
      this.desc,
      this.icon});

  SpecialtyModel.fromJson(Map<String, dynamic> json) : id = json['id'] {
    group = json['group'] != null ? GroupModel.fromJson(json['group']) : null;
    code = json['code'];
    title = json['title'];
    cType = json['c_type'];
    prev = json['prev'];
    desc = json['desc'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    data['code'] = code;
    data['title'] = title;
    data['c_type'] = cType;
    data['prev'] = prev;
    data['desc'] = desc;
    data['icon'] = icon;
    return data;
  }
}
