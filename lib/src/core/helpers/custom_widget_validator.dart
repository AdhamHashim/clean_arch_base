import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomWidgetValidator<T> extends StatelessWidget {
  final T? initialValue;
  final String name;
  final FormFieldValidator<T> validator;
  final Widget child;
  final Widget Function(FormFieldState<T>? value) builder;
  final InputDecorator? decoration;
  const CustomWidgetValidator(
      {super.key,
      this.initialValue,
      required this.name,
      required this.validator,
      required this.child,
      this.decoration,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      initialValue: initialValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return decoration ??
            InputDecorator(
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: field.errorText,
                errorStyle: const TextStyle(color: Colors.red),
              ),
              child: builder(field),
            );
      },
    );
  }
}
