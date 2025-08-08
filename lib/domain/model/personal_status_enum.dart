import 'package:flutter/material.dart';

enum PersonaStatusEnum {
  alive,
  unknown,
  dead;

  static PersonaStatusEnum fromString(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return PersonaStatusEnum.alive;
      case 'dead':
        return PersonaStatusEnum.dead;
      default:
        return PersonaStatusEnum.unknown;
    }
  }

  /// Returns a friendly description
  String get description {
    switch (this) {
      case PersonaStatusEnum.alive:
        return 'Alive';
      case PersonaStatusEnum.unknown:
        return 'Unknown';
      case PersonaStatusEnum.dead:
        return 'Dead';
    }
  }

  /// Returns the associated color for each status
  Color get color {
    switch (this) {
      case PersonaStatusEnum.alive:
        return const Color(0xFF55CC44); // green
      case PersonaStatusEnum.unknown:
        return const Color(0xFF9E9E9E); // grey
      case PersonaStatusEnum.dead:
        return const Color(0xFFCC4444); // red
    }
  }
}
