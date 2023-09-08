import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/ui/button_widget.dart';
import 'package:flutter_svg/svg.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const _ErrorImage(),
            const SizedBox(height: 24),
            const Text(
              "Network Issues",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CenteredText(
              text: _errorText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const Spacer(),
            CustomButton(
                onPressed: () {
                  appRouter.pop();
                },
                text: "Back Home"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            )
          ],
        ),
      );
}

class _ErrorImage extends StatelessWidget {
  const _ErrorImage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 3,
        padding: const EdgeInsets.only(top: 30),
        child: SvgPicture.asset(
          'assets/images/network_error_02.svg',
        ),
      );
}

const _errorText = "Issue connecting to the server.\nEnsure you have a stable internet connection and try again.";

// TODO: Review centering text
class CenteredText extends StatelessWidget {
  final String text;

  final TextStyle style;

  const CenteredText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      );
}
