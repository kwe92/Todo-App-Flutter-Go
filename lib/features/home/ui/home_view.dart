import 'package:flutter/material.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
