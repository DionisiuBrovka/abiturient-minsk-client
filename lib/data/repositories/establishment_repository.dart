import 'dart:convert';

import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:http/http.dart' as http;

class EstablishmentRepository {
  static Future<List<EstablishmentModel>> getSkillList() async {
    List<EstablishmentModel> result = [];

    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(
        Uri.parse('http://eduapp.dionisiubrovka.online/api/v2/establishment/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(EstablishmentModel.fromJson(index));
      }
    }
    return result;
  }
}
