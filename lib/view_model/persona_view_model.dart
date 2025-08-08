import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/persona_model.dart';
import 'package:rick_and_morty/data/repositories/persona_repository.dart';

class PersonaViewModel extends ChangeNotifier {
  final IPersonaRepository _personaService;

  String? errorMessage;

  PersonaViewModel(this._personaService) {
    getAllPersonas();
  }
  bool isLoading = false;
  String? nextRequestUrl;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final List<PersonaModel> personas = [];

  Future<void> getAllPersonas() async {
    try {
      setLoading(true);
      final response = await _personaService.getAllPersonas(nextRequestUrl);
      personas.addAll(response.personas);
      nextRequestUrl = response.nextRequestUrl;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setLoading(false);
    }
  }

  PersonaModel? actualPersona;
  Future<void> getPersona(String id) async {
    try {
      setLoading(true);
      actualPersona = await _personaService.getPersona(id);
    } catch (e) {
      actualPersona = null;
      errorMessage = e.toString();
    } finally {
      setLoading(false);
    }
  }
}
