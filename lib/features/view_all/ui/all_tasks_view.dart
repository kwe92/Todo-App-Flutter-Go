import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasseScaffold(
      showAppBar: true,
      title: 'All Tasks View',
      child: Container(),
    );
  }
}
