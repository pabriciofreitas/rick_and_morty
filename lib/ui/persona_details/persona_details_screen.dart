import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_color.dart';
import 'package:rick_and_morty/ui/shared/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/ui/shared/widgets/persona_widget.dart';
import 'package:rick_and_morty/ui/shared/widgets/title_widget.dart';

import 'package:rick_and_morty/view_model/persona_view_model.dart';

class PersonaDetailsScreen extends StatefulWidget {
  final PersonaViewModel personaViewModel;
  final String personaId;

  const PersonaDetailsScreen({
    super.key,
    required this.personaViewModel,
    required this.personaId,
  });

  @override
  State<PersonaDetailsScreen> createState() => _PersonaDetailsScreenState();
}

class _PersonaDetailsScreenState extends State<PersonaDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.personaViewModel.getPersona(widget.personaId);
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.personaViewModel.actualPersona = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: SingleChildScrollView(
            child: ListenableBuilder(
              listenable: widget.personaViewModel,
              builder: (context, _) {
                return Column(
                  children: [
                    AppBarWidget(showBackButton: true),
                    TitleWidget(),
                    widget.personaViewModel.isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(32),
                            child: CircularProgressIndicator(
                              color: AppColor.white,
                            ),
                          )
                        : widget.personaViewModel.actualPersona == null
                        ? SizedBox.shrink()
                        : Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 32,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 500,
                              maxWidth: 450,
                            ),
                            child: PersonaWidget(
                              persona: widget.personaViewModel.actualPersona!,
                              showDetails: true,
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
