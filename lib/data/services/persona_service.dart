import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty/data/model/persona_response_model.dart';
import 'package:rick_and_morty/data/repositories/persona_repository.dart';
import 'package:rick_and_morty/infra/api_service.dart';

class PersonaService implements IPersonaRepository {
  final ApiService _apiService;

  PersonaService(this._apiService);

  @override
  Future<PersonaResponseModel> getAllPersonas(String? nextRequestUrl) async {
    late Response response;
    if (nextRequestUrl == null) {
      response = await _apiService.get('');
    } else {
      response = await _apiService.get('', baseUrl: nextRequestUrl);
    }
    if (response.statusCode == 200) {
      return PersonaResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load personas');
    }
  }
}
