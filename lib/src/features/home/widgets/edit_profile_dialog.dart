import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({
    super.key,
    required this.title,
    required this.hintText,
    this.onSubmit,
    this.secondaryHintText,
    this.onSubmitTwoFields,
    this.obscureText = false,
    this.capitaliseFirstLetter = false,
  });

  final String title;
  final String hintText;
  final bool obscureText;
  final bool capitaliseFirstLetter;
  final void Function(String)? onSubmit;

  final String? secondaryHintText;
  final void Function(String, String)? onSubmitTwoFields;

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final TextEditingController _primaryController = TextEditingController();
  TextEditingController? _secondaryController;

  final FocusNode _primaryFocusNode = FocusNode();
  FocusNode? _secondaryFocusNode;

  bool _primaryFieldError = false;
  bool _secondaryFieldError = false;

  bool get _secondaryFieldExists =>
      widget.secondaryHintText != null && widget.onSubmitTwoFields != null;

  @override
  void initState() {
    super.initState();

    if (widget.onSubmitTwoFields != null) {
      _secondaryController = TextEditingController();
      _secondaryFocusNode = FocusNode();
    }

    _primaryFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _primaryController.dispose();
    _secondaryController?.dispose();

    _primaryFocusNode.dispose();
    _secondaryFocusNode?.dispose();

    super.dispose();
  }

  void onPrimaryChange(String value) {
    setState(() {
      if (widget.capitaliseFirstLetter) {
        final int offset = _primaryController.selection.baseOffset;
        value = value.capitalizeFirstofEach;

        setState(() {
          _primaryController.text = value;
          _primaryController.selection = TextSelection.fromPosition(
            TextPosition(offset: offset),
          );
        });
      }
      _primaryFieldError = false;
    });
  }

  void onSecondaryChange(_) {
    setState(() {
      _secondaryFieldError = false;
    });
  }

  void onFinalPrimarySubmit(String? _) {
    if (_secondaryFocusNode != null) {
      _secondaryFocusNode!.requestFocus();
    } else if (widget.onSubmit != null) {
      if (_primaryController.text.isEmpty) {
        setState(() {
          _primaryFieldError = true;
        });

        return;
      }
      widget.onSubmit!(_primaryController.text);
    }
  }

  void onFinalSecondarySubmit(String? _) {
    if (widget.onSubmitTwoFields != null) {
      if (_primaryController.text.isEmpty ||
          _secondaryController!.text.isEmpty) {
        setState(() {
          _primaryFieldError = _primaryController.text.isEmpty;
          _secondaryFieldError = _secondaryController!.text.isEmpty;
        });
        return;
      }
      widget.onSubmitTwoFields!(
        _primaryController.text,
        _secondaryController!.text,
      );
    }
  }

  void onButtonSubmit() {
    if (_secondaryController != null) {
      onFinalSecondarySubmit('');
    } else {
      onFinalPrimarySubmit('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ProfileEditField(
            controller: _primaryController,
            focusNode: _primaryFocusNode,
            hintText: widget.hintText,
            onSubmit: onFinalPrimarySubmit,
            onChange: onPrimaryChange,
            obscureText: widget.obscureText,
            errorExists: _primaryFieldError,
          ),
          if (_secondaryFieldExists) ...[
            const SizedBox(height: 5),
            ProfileEditField(
              controller: _secondaryController!,
              focusNode: _secondaryFocusNode!,
              hintText: widget.secondaryHintText!,
              onSubmit: onFinalSecondarySubmit,
              onChange: onSecondaryChange,
              obscureText: widget.obscureText,
              errorExists: _secondaryFieldError,
            ),
          ],
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              MyButton(
                text: 'Submit',
                onPressed: onButtonSubmit,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
