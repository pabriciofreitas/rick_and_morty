import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app_color.dart';

class AppBarWidget extends StatelessWidget {
  final bool showBackButton;
  const AppBarWidget({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Image.asset('assets/images/icon.png'),
          ),
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColor.primaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
