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
      .localUpdateAppointmentPhoneNumber(value);

  void onSubmitPhoneNumber(value) => _nameFocusNode.requestFocus();

  void onChangeName(String value) {
    // ! Deprecated due to the failure when working with Chinese input
    // final int offset = _nameController.selection.baseOffset;
    // value = value.capitalizeFirstofEach;

    // setState(() {
    //   _nameController.text = value;
    //   _nameController.selection = TextSelection.fromPosition(
    //     TextPosition(offset: offset),
    //   );
    // });

    ref
        .read(appointmentControllerProvider.notifier)
        .localUpdateAppointmentName(value);
  }

  void onSubmitContact() async {
    try {
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

      setState(() {
        _nameController.text = _nameController.text.capitalizeFirstofEach;
      });

      ref
          .read(appointmentControllerProvider.notifier)
          .localUpdateAppointmentName(_nameController.text);

      await ref.read(appointmentControllerProvider.notifier).bookAppointment();
    } on SlotNotAvailableException catch (_) {
      showFeedback(
        message: 'The time slot is no longer available. Please try again.',
      );

      ref.read(appointmentControllerProvider.notifier).previousStage();
      return;
    } on GenericAppointmentException catch (e) {
      showFeedback(message: e.message);
      return;
    }

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
      );
    }

    if (_nameController.text.isEmpty) {
      _nameController.text = name;
      _nameController.selection = TextSelection.collapsed(
        offset: _nameController.text.length,
      );
    }

    Widget button = ActionButton(
      text: 'CONFIRM',
      next: onSubmitContact,
    );

    Widget title = Text(
      'Please enter your phone:',
      style: GoogleFonts.libreBaskerville(
        textStyle: context.responsive(
          Theme.of(context).textTheme.headlineMedium,
          md: Theme.of(context).textTheme.displaySmall,
        ),
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        letterSpacing: BorderSide.strokeAlignInside,
        wordSpacing: BorderSide.strokeAlignOutside,
      ),
    );

    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 110),
          title,
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
            onSubmitted: (_) => onSubmitContact(),
            hasError: nameError,
            errorHintText: 'required',
          ),
          context.responsive(
            const SizedBox(height: 60),
            md: Stack(
              children: [
                const SizedBox(
                  height: 110,
                  width: double.infinity,
                ),
                Positioned(
                  right: 0,
                  bottom: 20,
                  child: button,
                ),
              ],
            ),
          ),
          context.responsive(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: button,
            ),
            md: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
