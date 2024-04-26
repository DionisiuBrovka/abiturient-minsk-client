import 'dart:convert';

import 'package:flutter_eduapp_new/api/api_controller.dart';
import 'package:flutter_eduapp_new/data/models/faq_model.dart';
import 'package:http/http.dart' as http;

class FAQRepository {
  static Future<List<FAQModel>> getList() async {
    List<FAQModel> result = [];

    final response = await http.get(Uri.parse('$API_ROOT$API_VER/faq/'));
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        result.add(FAQModel.fromJson(index));
      }
    }
    return result;
  }
}
