import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/colors/app_colors.dart';
import 'package:flutter_golang_yt/features/shared/ui/base_scaffold.dart';

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
        padding: const EdgeInsets.only(left: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: _backgroundImage,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _HomeViewTitle(),
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

