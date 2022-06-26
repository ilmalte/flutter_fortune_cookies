import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';
import 'model.dart';

class CookiesApi {
  final httpClient = HttpClient();
  final url = Uri.https(
      "raw.githubusercontent.com",
      "/ilmalte/developer-fortune-cookies/master/documents/fortune-cookies.json",
      null);

  Future<List<Cookie>> getAll() async {
    List<Cookie>? cookiesResponse;
    cookiesResponse = [];

    final httpRequest = await httpClient.getUrl(url);
    final httpResponse = await httpRequest.close();
    if (httpResponse.statusCode != HttpStatus.ok) {
      return cookiesResponse;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final jsonResponse = json.decode(responseBody);
    for (var cookie in jsonResponse) {
      cookiesResponse.add(Cookie.fromJson(cookie));
    }
    return cookiesResponse;
  }
}
