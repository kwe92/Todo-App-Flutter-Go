import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/clickable_icon.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClickableIcon(
      onTap: () => appRouter.popAndPush(
        const HomeRoute(),
      ),
      iconData: Icons.home,
    );
  }
}
