import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

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
