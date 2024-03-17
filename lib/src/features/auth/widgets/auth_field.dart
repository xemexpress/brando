import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.currentFocusNode,
    required this.hintText,
    required this.icon,
    this.nextFocusNode,
    this.inputFormatters,
    this.textInputAction,
    this.signInUser,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController controller;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final String hintText;
  final IconData icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final void Function()? signInUser;
  final TextInputType textInputType;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();

    widget.currentFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.currentFocusNode.removeListener(_onFocusChange);

    super.dispose();
  }

  void _onFocusChange() {
    if (!widget.currentFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void onChange(_) {
    setState(() {
      isEmpty = widget.controller.text.isEmpty;
    });
  }

  void onSubmitted() {
    widget.currentFocusNode.unfocus();

    if (widget.nextFocusNode != null) {
      setState(() {
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      });
    }

    if (widget.signInUser != null) {
      widget.signInUser!();
    }
  }

  void onClear() {
    setState(() {
      widget.controller.clear();
      isEmpty = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.currentFocusNode,
        onChanged: onChange,
        onEditingComplete: onSubmitted,
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(context.responsive(7, md: 35.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(context.responsive(7, md: 35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(context.responsive(7, md: 35.0)),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.openSans(
            textStyle: Theme.of(context).textTheme.labelLarge,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.surfaceVariant,
            height: 1,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: Icon(
              widget.icon,
              size: 27,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          suffixIcon: isEmpty || !widget.currentFocusNode.hasFocus
              ? null
              : GestureDetector(
                  onTap: onClear,
                  child: Icon(
                    Icons.cancel,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    size: 20,
                  ),
                ),
          contentPadding: const EdgeInsets.only(top: 30),
        ),
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
      ),
    );
  }
}
