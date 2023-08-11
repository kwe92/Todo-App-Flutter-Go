import 'package:flutter/material.dart';

class BasseScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showAppBar;
  const BasseScaffold({required this.title, required this.child, this.showAppBar = false, super.key});

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
