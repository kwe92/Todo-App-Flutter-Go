import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

class TopSecton extends StatelessWidget {
  const TopSecton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ScreenSize.getHeight(context) / 3.5,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(
        top: 18,
        left: 12,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/header1.jpg'),
        ),
      ),
      child: BackArrowIcon(
        onTap: () => appRouter.pop(),
      ),
    );
  }
}