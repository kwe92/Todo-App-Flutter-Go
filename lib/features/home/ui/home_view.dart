import 'package:auto_route/auto_route.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/features/home/ui/widgets/home_title.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';
import 'package:flutter_golang_yt/features/shared/utility/get_screen_size.dart';

// TODO: add gap package and replace SizedBox

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => BaseScaffold(
        title: 'Home View',
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            top: 46,
            right: 20,
            bottom: ScreenSize.getHeight(context) / 12,
            // bottom: 76,
          ),
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: _backgroundImage,
          child: Entry.opacity(
            duration: const Duration(seconds: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HomeTitle(),
                SizedBox(
                  height: ScreenSize.getHeight(context) / 2.5,
                ),
                const Spacer(),
                ..._buttons
              ],
            ),
          ),
        ),
      );
}

final List<Widget> _buttons = [
  CustomButton(
    text: 'Add Task',
    onPressed: () {
      appRouter.push(
        const AddTaskRoute(),
      );
    },
  ),
  const SizedBox(height: 20),
  CustomButton(
    isSecondary: true,
    text: 'View All',
    onPressed: () {
      appRouter.push(
        const AllTasksRoute(),
      );
    },
  ),
];

/// [BoxDecoration] with a [DecorationImage].
const _backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/coffee-table3.avif'),
    fit: BoxFit.cover,
  ),
);



// Container Background Image

// DecorationImage(
//          fit: BoxFit.cover, image: '...')
