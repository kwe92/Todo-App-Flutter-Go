import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/back_arrow_icon.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/view_all/ui/widgets/add_icon.dart';
import 'package:flutter_golang_yt/features/view_all/ui/widgets/home_icon.dart';

@RoutePage()
class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasseScaffold(
      title: 'All Tasks View',
      child: Column(
        children: [
          _TopSecton(),
          _MiddleSection(),
        ],
      ),
    );
  }
}

class _TopSecton extends StatelessWidget {
  const _TopSecton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _MiddleSection extends StatelessWidget {
  const _MiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, top: 6.0, right: 12.0),
      child: ColoredBox(
        color: Colors.orange,
        child: Row(
          children: [
            HomeIcon(),
            SizedBox(width: 6),
            AddIcon(),
            //? use Spacer instead of wrapping sections of the Row in Containers and spacing evenly
            Spacer(),
            Icon(
              Icons.file_copy,
            )
          ],
        ),
      ),
    );
  }
}
