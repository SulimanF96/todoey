import 'dart:convert';
import 'package:http/http.dart';

const String baseUrl = '';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    Response response = await get(Uri.parse(baseUrl+url));
    if (response.statusCode == 200) {
      dynamic decodedBody = jsonDecode(response.body);
      return decodedBody;
    } else {
      print(response.statusCode);
    }
  }

  Future postData(Map body) async {
    final headers = {"Content-type": "application/json"};
    print(body);
    print(json.encode(body));
    print(jsonEncode(body));
    Response response = await post(Uri.parse(baseUrl+url), headers: headers, body: json.encode(body), encoding: Encoding.getByName("application/json"));
    print(response.body);
    if (response.statusCode == 200) {
       dynamic decodedBody = response.body.isNotEmpty ? jsonDecode(response.body): null;

      return {"status": response.statusCode, "decodedBody": decodedBody};
    } else {
      return {"status": response.statusCode, "decodedBody": null};
    }
  }
}
