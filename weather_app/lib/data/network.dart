import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWork {
  NetWork(this.url);
  final String url;

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
