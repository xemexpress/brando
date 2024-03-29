import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPanelInput extends ConsumerWidget {
  const ContactPanelInput({
    super.key,
    required this.label,
    required this.type,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    required this.hasError,
    required this.errorHintText,
  });

  final String label;
  final ContactPanelInputType type;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final bool hasError;
  final String errorHintText;

  Function(String) updateTitle(WidgetRef ref) {
    return (value) => ref
        .read(appointmentControllerProvider.notifier)
        .localUpdateAppointmentTitle(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget? prefixWidget;

    if (type == ContactPanelInputType.phoneNumber) {
      prefixWidget = Text(
        '+852',
        style: Theme.of(context).textTheme.titleMedium,
      );
    } else if (type == ContactPanelInputType.name) {
      final String title =
          ref.watch(appointmentControllerProvider).appointment.title;

      prefixWidget = MenuBar(
        style: const MenuStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          elevation: MaterialStatePropertyAll<double>(0),
        ),
        children: [
          SubmenuButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
            ),
            menuStyle: const MenuStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
            ),
            menuChildren: [
              TitleMenuButton(value: 'Mr.', onPressed: updateTitle(ref)),
              TitleMenuButton(value: 'Mrs.', onPressed: updateTitle(ref)),
              TitleMenuButton(value: 'Miss', onPressed: updateTitle(ref)),
              TitleMenuButton(value: 'Dr.', onPressed: updateTitle(ref)),
            ],
            child: Text(
              title.isEmpty ? 'Title' : title,
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: context.responsive(null, md: 270),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefix: const SizedBox(width: 8),
              prefixIconConstraints:
                  const BoxConstraints.tightForFinite(height: 25),
              prefixIcon: Container(
                width: 60,
                padding: const EdgeInsets.only(left: 1),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                  ),
                  color: Colors.transparent,
                ),
                child: prefixWidget,
              ),
              hintText: hasError ? errorHintText : null,
              hintStyle: hasError
                  ? TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: context.responsive(
                  BorderRadius.circular(inputBorderRadiusMobile),
                  md: BorderRadius.zero,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: context.responsive(
                  BorderRadius.circular(inputBorderRadiusMobile),
                  md: BorderRadius.zero,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.responsive(
                  BorderRadius.circular(inputBorderRadiusMobile),
                  md: BorderRadius.zero,
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 10.0,
              ),
            ),
            keyboardType: type == ContactPanelInputType.phoneNumber
                ? TextInputType.phone
                : type == ContactPanelInputType.name
                    ? TextInputType.name
                    : null,
            inputFormatters: type == ContactPanelInputType.phoneNumber
                ? [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : null,
            textCapitalization: type == ContactPanelInputType.name
                ? TextCapitalization.words
                : TextCapitalization.none,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          ),
        ],
      ),
    );
  }
}
