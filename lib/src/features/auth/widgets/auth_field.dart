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
    this.obscureText = false,
  });

  final TextEditingController controller;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final String hintText;
  final IconData icon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isEmpty = true;

  void onChange(_) {
    setState(() {
      isEmpty = widget.controller.text.isEmpty;
    });
  }

  void onSubmitted() {
    if (widget.nextFocusNode != null) {
      setState(() {
        widget.currentFocusNode.unfocus();
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      });
    } else {
      // Log the user in.
      print('Log in user');
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
        style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.openSans(
            textStyle: Theme.of(context).textTheme.titleMedium,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.surfaceVariant,
            height: 1,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: Icon(
              widget.icon,
              // size: 30,
              size: 27,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          suffixIcon: isEmpty || !widget.currentFocusNode.hasFocus
              ? null
              : IconButton(
                  onPressed: onClear,
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    size: 20,
                  ),
                ),
          contentPadding: const EdgeInsets.only(top: 30),
        ),
        keyboardType: TextInputType.number,
        obscureText: widget.obscureText,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
