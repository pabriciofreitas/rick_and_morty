import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/ui/core/app_color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: Center(
        child: const Text(
          'Rick and Morty',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
