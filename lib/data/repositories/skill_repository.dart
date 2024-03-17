import 'dart:convert';

import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:http/http.dart' as http;

class SkillRepository {
  static Future<List<SkillModel>> getSkillList() async {
    List<SkillModel> result = [];

    await Future.delayed(const Duration(seconds: 1));

    final response = await http
        .get(Uri.parse('http://eduapp.dionisiubrovka.online/api/v2/skill/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(SkillModel.fromJson(index));
      }
    }
    return result;
  }
}
