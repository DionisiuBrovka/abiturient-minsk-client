import 'package:flutter_eduapp_new/data/models/skill_model.dart';

class SvodTable {
  int id;
  List<SkillModel>? skill;
  String? sType;
  int? bCount;
  String? bLong;
  double? bAvd;
  int? pCount;
  String? pLong;
  double? pAvd;
  String? rule;
  bool? isOpfr;
  String? opfrQnic;
  int? est;

  SvodTable(
      {required this.id,
      this.skill,
      this.sType,
      this.bCount,
      this.bLong,
      this.bAvd,
      this.pCount,
      this.pLong,
      this.pAvd,
      this.rule,
      this.isOpfr,
      this.opfrQnic,
      this.est});

  SvodTable.fromJson(Map<String, dynamic> json) : id = json['id'] {
    if (json['skill'] != null) {
      skill = <SkillModel>[];
      json['skill'].forEach((v) {
        skill!.add(SkillModel.fromJson(v));
      });
    }
    sType = json['s_type'];
    bCount = json['b_count'];
    bLong = json['b_long'];
    bAvd = json['b_avd'];
    pCount = json['p_count'];
    pLong = json['p_long'];
    pAvd = json['p_avd'];
    rule = json['rule'];
    isOpfr = json['is_opfr'];
    opfrQnic = json['opfr_qnic'];
    est = json['est'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (skill != null) {
      data['skill'] = skill!.map((v) => v.toJson()).toList();
    }
    data['s_type'] = sType;
    data['b_count'] = bCount;
    data['b_long'] = bLong;
    data['b_avd'] = bAvd;
    data['p_count'] = pCount;
    data['p_long'] = pLong;
    data['p_avd'] = pAvd;
    data['rule'] = rule;
    data['is_opfr'] = isOpfr;
    data['opfr_qnic'] = opfrQnic;
    data['est'] = est;
    return data;
  }
}
