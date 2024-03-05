import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPanelInput extends StatelessWidget {
  const ContactPanelInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.onChanged,
    required this.onSubmitted,
    this.isPhoneNumber = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final bool isPhoneNumber;
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefix: isPhoneNumber ? const SizedBox(width: 8) : null,
            prefixIconConstraints: const BoxConstraints.tightFor(height: 25),
            prefixIcon: isPhoneNumber
                ? Container(
                    width: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide()),
                      // color: Colors.red,
                    ),
                    child: Text(
                      '+852',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                : null,
            border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
            enabledBorder:
                const OutlineInputBorder(borderRadius: BorderRadius.zero),
            focusedBorder:
                const OutlineInputBorder(borderRadius: BorderRadius.zero),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 10.0,
            ),
          ),
          keyboardType:
              isPhoneNumber ? TextInputType.phone : TextInputType.text,
          inputFormatters: isPhoneNumber
              ? [
                  LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
          textCapitalization: isPhoneNumber
              ? TextCapitalization.none
              : TextCapitalization.words,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
