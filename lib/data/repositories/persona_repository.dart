import 'package:rick_and_morty/data/model/persona_response_model.dart';

abstract class IPersonaRepository {
  Future<PersonaResponseModel> getAllPersonas(String? nextRequestUrl);
}
