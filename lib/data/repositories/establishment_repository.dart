import 'dart:convert';

import 'package:flutter_eduapp_new/api/api_controller.dart';
import 'package:flutter_eduapp_new/data/models/establishment_model.dart';
import 'package:http/http.dart' as http;

class EstablishmentRepository {
  static Future<List<EstablishmentModel>> getList() async {
    List<EstablishmentModel> result = [];

    await Future.delayed(const Duration(seconds: 1));

    final response =
        await http.get(Uri.parse('$API_ROOT$API_VER/establishment/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(EstablishmentModel.fromJson(index));
      }
    }
    return result;
  }

  static Future<EstablishmentModel?> getObject(int id) async {
    EstablishmentModel? result;

    final response =
        await http.get(Uri.parse('$API_ROOT$API_VER/establishment/$id/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      result = EstablishmentModel.fromJson(data as Map<String, dynamic>);
    }
    return result;
  }
}
