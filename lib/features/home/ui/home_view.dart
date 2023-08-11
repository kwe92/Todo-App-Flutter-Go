import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/home/widgets/button_widget.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';

// TODO: add gap package and replace SizedBox

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BasseScaffold(
      title: 'Home View',
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: _backgroundImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _HomeViewTitle(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Add Task',
              textColor: Colors.white,
              buttonColor: AppColors.mainColor,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomButton(
              onPressed: () {},
              text: 'View All',
              buttonColor: Colors.white,
              textColor: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}

/// [BoxDecoration] with a [DecorationImage].
const _backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/welcome.jpg'),
    fit: BoxFit.cover,
  ),
);

class _HomeViewTitle extends StatelessWidget {
  const _HomeViewTitle({super.key});

  @override
  Widget build(BuildContext context) => RichText(
        maxLines: 2,
        text: const TextSpan(
          text: 'Hello',
          children: [
            TextSpan(
              text: '\nstart your beautiful day.',
              style: TextStyle(
                color: AppColors.smallTextColor,
                fontSize: 14,
              ),
            ),
          ],
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

// RichText

//   - required to use TextSpan and create paragraphs of text
//   - it can control the visible lines within the paragraph
//     with the 'maxLines' property

// TextSpan

//   - a widget that allows text to span multiple lines
//   - similar to the paragraph <pr> element "tag" in CSS
//   - there is no intrinsic line break so a \n (new-line) prefix
//     is required for each line of text
//   - to have multiple lines you can pass one or more TextSpan widgets
//     to the 'children' property

