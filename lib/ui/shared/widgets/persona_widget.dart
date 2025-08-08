// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/core/app_color.dart';

import 'package:rick_and_morty/domain/model/persona_model.dart';

class PersonaWidget extends StatelessWidget {
  final PersonaModel persona;
  final bool showDetails;
  const PersonaWidget({
    super.key,
    required this.persona,
    this.showDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColor.background.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              persona.image,
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              persona.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          if (showDetails)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: persona.status.color,
                    maxRadius: 10,
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: width <= 500 ? width - 80 : 450,
                    ),
                    child: Text(
                      '${persona.status.description} - ${persona.species}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
