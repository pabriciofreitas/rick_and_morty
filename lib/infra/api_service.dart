import 'package:http/http.dart' as http;
// import 'package:rick_and_morty/core/app_print.dart';

class ApiService {
  static const baseurl = 'https://rickandmortyapi.com/api/character/';
  final client = http.Client();

  Future<http.Response> get(String path, {String baseUrl = baseurl}) async {
    try {
      String wholeUrl = baseUrl + path;
      http.Response response = await client.get(Uri.parse(wholeUrl));
      //console('GET URL: $wholeUrl');
      // console('RESPONSE BODY : ${response.body}');
      // console('STATUS CODE : ${response.statusCode}');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
