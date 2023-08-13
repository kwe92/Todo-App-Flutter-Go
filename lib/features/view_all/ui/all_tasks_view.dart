import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.5,
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
          ),
        ],
      ),
    );
  }
}
