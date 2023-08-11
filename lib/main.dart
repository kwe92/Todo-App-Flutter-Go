import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/features/home/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: HomeView(),
      );
}
