import 'package:flutter/material.dart';

class ProfileEditField extends StatelessWidget {
  const ProfileEditField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.onSubmit,
    this.onChange,
    this.obscureText,
    this.errorExists = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final bool? obscureText;
  final bool errorExists;

  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: errorExists ? Theme.of(context).colorScheme.error : Colors.black,
        width: errorExists ? 1.5 : 0.7,
      ),
    );

    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        border: outlineBorder,
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
      ),
      onChanged: onChange,
      onSubmitted: onSubmit,
      obscureText: obscureText ?? false,
    );
  }
}
