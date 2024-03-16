import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/appointment/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPanel extends ConsumerStatefulWidget {
  const ContactPanel({
    super.key,
  });

  @override
  ConsumerState<ContactPanel> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPanel> {
  Appointment? appointment;

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _nameController.dispose();

    _phoneNumberFocusNode.dispose();
    _nameFocusNode.dispose();

    super.dispose();
  }

  void onChangePhoneNumber(String value) => ref
      .read(appointmentControllerProvider.notifier)
      .updateAppointmentPhoneNumber(value);

  void onSubmitPhoneNumber(value) => _nameFocusNode.requestFocus();

  void onChangeName(String value) {
    final int offset = _nameController.selection.baseOffset;
    value = value.capitalizeFirstofEach;

    setState(() {
      _nameController.text = value;
      _nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: offset),
      );
    });

    ref
        .read(appointmentControllerProvider.notifier)
        .updateAppointmentName(value);
  }

  void onSubmitContact(_) async {
    final String name = _nameController.text;
    final String phoneNumber = _phoneNumberController.text;

    if (name.isEmpty || phoneNumber.isEmpty) {
      if (name.isEmpty) {
        ref
            .read(appointmentControllerProvider.notifier)
            .raiseError(ContactPanelInputType.name);
      }

      if (phoneNumber.isEmpty) {
        ref
            .read(appointmentControllerProvider.notifier)
            .raiseError(ContactPanelInputType.phoneNumber);
      }

      showMySnackBar(context: context, message: 'Please fill in all fields.');
      return;
    }

    await ref.read(appointmentControllerProvider.notifier).bookAppointment();
    ref.read(appointmentControllerProvider.notifier).nextStage();
  }

  @override
  Widget build(BuildContext context) {
    final AppointmentState appointmentState =
        ref.watch(appointmentControllerProvider);

    final bool phoneNumberError = appointmentState.phoneNumberError;
    final bool nameError = appointmentState.nameError;

    final String phoneNumber = appointmentState.appointment.phoneNumber;
    final String name = appointmentState.appointment.name;

    if (_phoneNumberController.text.isEmpty) {
      _phoneNumberController.text = phoneNumber;
      _phoneNumberController.selection = TextSelection.collapsed(
        offset: _phoneNumberController.text.length,
      ); // Place cursor at the end
    }

    if (_nameController.text.isEmpty) {
      _nameController.text = name;
      _nameController.selection = TextSelection.collapsed(
        offset: _nameController.text.length,
      ); // Place cursor at the end
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please enter your phone:',
              style: GoogleFonts.libreBaskerville(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: BorderSide.strokeAlignInside,
                wordSpacing: BorderSide.strokeAlignOutside,
              ),
            ),
            const SizedBox(height: 20),
            ContactPanelInput(
              label: 'Phone number*',
              type: ContactPanelInputType.phoneNumber,
              controller: _phoneNumberController,
              focusNode: _phoneNumberFocusNode,
              onChanged: onChangePhoneNumber,
              onSubmitted: onSubmitPhoneNumber,
              hasError: phoneNumberError,
              errorHintText: 'required',
            ),
            const SizedBox(height: 20),
            ContactPanelInput(
              label: 'How may I address you?*',
              type: ContactPanelInputType.name,
              controller: _nameController,
              focusNode: _nameFocusNode,
              onChanged: onChangeName,
              onSubmitted: onSubmitContact,
              hasError: nameError,
              errorHintText: 'required',
            ),
          ],
        ),
      ),
    );
  }
}
