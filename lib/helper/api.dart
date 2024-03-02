import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post({
    required String url,
    required Map<String, String> headers,
    required String foodItem,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode({"query": foodItem}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> get({
    required String url,
    required Map<String, String> headers,
    required String foodItem,
  }) async {
    var requestUrl = Uri.parse('$url?query=$foodItem');

    http.Response response = await http.get(
      requestUrl,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to load data: ${response.statusCode} - ${response.reasonPhrase}',
      );
    }
  }
}
