import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showAppBar;
  const BaseScaffold({
    required this.title,
    required this.child,
    this.showAppBar = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: showAppBar
              ? AppBar(
                  title: Text(title),
                )
              : null,
          body: child,
        ),
      );
}
