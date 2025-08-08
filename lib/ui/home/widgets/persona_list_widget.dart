import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_color.dart';
import 'package:rick_and_morty/data/services/persona_service.dart';
import 'package:rick_and_morty/infra/api_service.dart';
import 'package:rick_and_morty/ui/shared/widgets/persona_widget.dart';
import 'package:rick_and_morty/ui/persona_details/persona_details_screen.dart';
import 'package:rick_and_morty/view_model/persona_view_model.dart';

class PersonaListWidget extends StatefulWidget {
  final ScrollController scrollController;
  const PersonaListWidget({super.key, required this.scrollController});

  @override
  State<PersonaListWidget> createState() => _PersonaListWidgetState();
}

class _PersonaListWidgetState extends State<PersonaListWidget> {
  late PersonaViewModel personaViewModel;

  @override
  void initState() {
    personaViewModel = PersonaViewModel(PersonaService(ApiService()));
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels >=
          widget.scrollController.position.maxScrollExtent) {
        if (personaViewModel.nextRequestUrl != null &&
            !personaViewModel.isLoading) {
          personaViewModel.getAllPersonas();
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      personaViewModel.addListener(() {
        if (personaViewModel.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(personaViewModel.errorMessage!)),
          );
          personaViewModel.errorMessage = null;
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    personaViewModel.removeListener(() {});
    personaViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: personaViewModel,
      builder: (context, _) => Container(
        color: AppColor.background,
        constraints: BoxConstraints(minHeight: 800),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: personaViewModel.personas.length,
              padding: const EdgeInsets.all(32.0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500, // largura máxima de cada item
                mainAxisExtent: 450, // altura de cada item
                mainAxisSpacing: 32, // espaço vertical entre os itens
                crossAxisSpacing: 32, // espaço horizontal entre os itens
                childAspectRatio: 1, // largura / altura
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PersonaDetailsScreen(
                          personaId: personaViewModel.personas[index].id
                              .toString(),
                          personaViewModel: personaViewModel,
                        ),
                      ),
                    );
                  },
                  child: PersonaWidget(
                    persona: personaViewModel.personas[index],
                  ),
                );
              },
            ),
            personaViewModel.isLoading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: CircularProgressIndicator(color: AppColor.white),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
