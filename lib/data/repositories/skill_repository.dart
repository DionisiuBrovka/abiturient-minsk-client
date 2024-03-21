import 'dart:convert';
import 'dart:developer';

import 'package:flutter_eduapp_new/api/api_controller.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:http/http.dart' as http;

class SkillRepository {
  static Future<List<SkillModel>> getSkillList() async {
    List<SkillModel> result = [];

    final response = await http.get(Uri.parse('$API_ROOT$API_VER/skill/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(SkillModel.fromJson(index));
      }
    }
    return result;
  }

  static Future<SkillModel?> getSkill(int id) async {
    SkillModel? result;

    final response = await http.get(Uri.parse('$API_ROOT$API_VER/skill/$id/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      result = SkillModel.fromJson(data as Map<String, dynamic>);
    }
    return result;
  }
}
