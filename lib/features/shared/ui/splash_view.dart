import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/router/app_router.gr.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';

// TODO: Refactor Implementation
@RoutePage()
class SplashView extends StatefulWidget {
  final int duration;

  const SplashView({this.duration = 1, super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _splashDuration() async {
    await Future.delayed(
        Duration(
          seconds: widget.duration,
        ), () {
      appRouter.replace(
        const AllTasksRoute(),
      );
    });

    // TODO: make replacement route a variable?
  }

  @override
  void initState() {
    _splashDuration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// TODO: review

// Future.delayed parameters

//   - second parameter can take a callback as an argument

