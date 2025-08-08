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

lib/<br>
├── data/<br>
│   ├── model/<br>
│   │   └── persona_response_model.dart<br>
│   ├── repositories/<br>
│   │   └── persona_repository.dart<br>
│   └── services/<br>
│       ├── api_service.dart<br>
│       └── persona_service.dart<br>
│<br>
├── domain/<br>
│   └── model/<br>
│       ├── persona_model.dart<br>
│       └── personal_status_enum.dart<br>
│<br>
├── ui/<br>
│   ├── core/<br>
│   │   ├── app_color.dart<br>
│   │   └── app_print.dart<br>
│   │<br>
│   ├── home/<br>
│   │   └── widgets/persona_list_widget.dart<br>
│   │       └── home_screen.dart<br>
│   │<br>
│   ├── persona_details/<br>
│   │   └── persona_details_screen.dart<br>
│   │<br>
│   └── shared/<br>
│       ├── view_model/<br>
│       │   └── persona_view_model.dart<br>
│       └── widgets/<br>
│           ├── app_bar_widget.dart<br>
│           ├── persona_widget.dart<br>
│           └── title_widget.dart<br>
│<br>
└── main.dart<br>

## Descrição

Este projeto consiste em uma aplicação Flutter para exibir informações de personagens da série Rick and Morty, organizando a lógica em camadas claras para melhor manutenção e escalabilidade.
