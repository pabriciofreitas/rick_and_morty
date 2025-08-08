import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_color.dart';
import 'package:rick_and_morty/ui/shared/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/ui/home/widgets/persona_list_widget.dart';
import 'package:rick_and_morty/ui/shared/widgets/title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                AppBarWidget(),
                TitleWidget(),
                PersonaListWidget(scrollController: _scrollController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
