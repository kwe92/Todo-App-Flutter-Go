import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';

class AddTaskTextForField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  const AddTaskTextForField({
    required this.controller,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: maxLines == 1
            ? Theme.of(context)
            : Theme.of(context).copyWith(
                inputDecorationTheme: multiLineInputDecorationTheme,
              ),
        child: TextFormField(
          maxLines: maxLines,
          controller: controller,
        ),
      );
}
