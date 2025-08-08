# Desafio Técnico: Rick and Morty

**Participante:** Pabricio Freitas

## Preview

Confira o projeto online em:  
[https://pabriciofreitas.github.io/rick_and_morty/](https://pabriciofreitas.github.io/rick_and_morty/)


## Flutter versão:
3.32.8

## Gerencia de estado
ChangeNotifier

## Arquitetura do Projeto 
MVVM 

lib/
│
├── core/
│   ├── app_color.dart
│   └── app_print.dart
│
├── data/
│   ├── model/
│   │    ├── persona_model.dart
│   │    ├── persona_response_model.dart
│   │    └── personal_status_enum.dart
│   │
│   ├── repositories/
│   │    └── persona_repository.dart
│   │
│   └── services/
│        └── persona_service.dart
│
├── infra/
│    └── api_service.dart
│
├── ui/
│   ├── home/
│   │    ├── widgets/
│   │    │     └── persona_list_widget.dart
│   │    └── home_screen.dart
│   │
│   ├── persona_details/
│   │    └── persona_details_screen.dart
│   │
│   └── shared/
│        └── widgets/
│              ├── app_bar_widget.dart
│              ├── persona_widget.dart
│              └── title_widget.dart
│
├── view_model/
│    ├── persona_view_model.dart
│
└── main.dart

## Descrição

Este projeto consiste em uma aplicação Flutter para exibir informações de personagens da série Rick and Morty, organizando a lógica em camadas claras para melhor manutenção e escalabilidade.
