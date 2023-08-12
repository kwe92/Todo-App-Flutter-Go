import 'package:flutter/material.dart';

class AddTaskTextForField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final Radius rounding;
  const AddTaskTextForField({
    required this.controller,
    this.maxLines = 1,
    required this.rounding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              rounding,
            ),
          ),
        ),
      );
}
