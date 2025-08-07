import 'package:rick_and_morty/data/model/persona_model.dart';

class PersonaResponseModel {
  List<PersonaModel> personas;
  String? nextRequestUrl;

  PersonaResponseModel({required this.personas, this.nextRequestUrl});
  factory PersonaResponseModel.fromJson(Map<String, dynamic> json) {
    return PersonaResponseModel(
      personas: List<PersonaModel>.from(
        json['results'].map((x) => PersonaModel.fromJson(x)),
      ),
      nextRequestUrl: json['info']['next'],
    );
  }
}
