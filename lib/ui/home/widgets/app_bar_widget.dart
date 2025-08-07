import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_color.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: 53,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset('assets/images/icon.png'),
        ),
      ),
    );
  }
}
