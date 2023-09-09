import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/app/themes/theme.dart';
import 'package:flutter_golang_yt/features/shared/services/services.dart';
import 'package:flutter_golang_yt/features/shared/services/utilities/string_service.dart';

class AddTaskTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final bool readOnly;

  const AddTaskTextFormField({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.readOnly = false,
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
          readOnly: readOnly,
          maxLines: maxLines,
          controller: controller,
          validator: stringService.customValidator(
            controller.text,
            configuration: const StringValidatorConfiguration(
              notEmpty: true,
            ),
          ),
          decoration: InputDecoration(hintText: hintText),
        ),
      );
}

// Dynamic Theming

//   - You can dynamically theme a widget anywhere in your widget tree
//   - by Wrapping the widget with a Theme Widget
//     then condotionally changing the argument to the 'data' property
//     predicated on some condition using Theme.of(context) for default theming
//     and Theme.of(context).copyWith() to change explicit parts of the Theme for
//     that widget

// InputDecoration | Widget

//   - TextForm field styling
//   - passed as an argument to the decoration property
//     of a TextFormField 
 
// Multi-line TextFormField

//   - pass an integer to the `maxLines` property specifing
//     the number of lines you want the TextFormField to have

