import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';

class AddTaskTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const AddTaskTextFormField({
    required this.controller,
    required this.hintText,
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
          decoration: InputDecoration(hintText: hintText),
        ),
      );
}

// Dynamic Theming

//   - Wrapping a widget with a Theme Widget then condotionally
//     changing the argument to the 'data' property
//     predicated on some condition allows you to dynamically theme that Widget
//     with Theme.of(context).copyWith() by passing the properties you want to change

// Input Decoration

//   - The borders, labels, icons, and styles for a TextFormField
//   - passed as an argument to the decoration property 
 
// Multi-line TextFormField

//   - if you want to have a TExtFormField with multiple lines then you can
//     pass an integer to the maxLines property
