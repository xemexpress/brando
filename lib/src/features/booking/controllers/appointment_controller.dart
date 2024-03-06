import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:brando/src/models/models.dart';

class AppointmentState {
  AppointmentState({
    required this.appointment,
    required this.isSelectingDate,
    required this.isSelectingTimeslot,
    DateTime? currentlyViewingMonth,
    this.stage = 2,
    this.phoneNumberError = false,
    this.nameError = false,
  }) : currentlyViewingMonth = currentlyViewingMonth ??
            DateTime(appointment.date.year, appointment.date.month);

  Appointment appointment;
  int stage; // stage = 0 when selecting date & time; stage = 1 when leaving contact details; stage = 2 when summarising appointment.

  // Stage 1
  bool isSelectingDate;
  bool isSelectingTimeslot;
  DateTime currentlyViewingMonth;

  // Stage 2
  bool phoneNumberError;
  bool nameError;

  AppointmentState copyWith({
    Appointment? appointment,
    int? stage,
    bool? isSelectingDate,
    bool? isSelectingTimeslot,
    DateTime? currentlyViewingMonth,
    bool? phoneNumberError,
    bool? nameError,
  }) {
    return AppointmentState(
      appointment: appointment ?? this.appointment,
      stage: stage ?? this.stage,
      currentlyViewingMonth:
          currentlyViewingMonth ?? this.currentlyViewingMonth,
      isSelectingDate: isSelectingDate ?? this.isSelectingDate,
      isSelectingTimeslot: isSelectingTimeslot ?? this.isSelectingTimeslot,
      phoneNumberError: phoneNumberError ?? this.phoneNumberError,
      nameError: nameError ?? this.nameError,
    );
  }
}

class AppointmentController extends StateNotifier<AppointmentState> {
  AppointmentController({required Appointment appointment})
      : super(
          AppointmentState(
            appointment: appointment,
            isSelectingDate: true,
            isSelectingTimeslot: true,
          ),
        );

  void updateAppointmentDate(DateTime date) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        date: date,
      ),
      isSelectingDate: false,
    );
  }

  void updateAppointmentTimeslot(
      (TimeOfDay startTime, TimeOfDay endTime) timeslot) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        startTime: timeslot.$1,
        endTime: timeslot.$2,
      ),
      isSelectingTimeslot: false,
    );
  }

  void updateAppointmentPhoneNumber(String phoneNumber) {
    state = state.copyWith(
      phoneNumberError: false,
      appointment: state.appointment.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void updateAppointmentName(String name) {
    state = state.copyWith(
      nameError: false,
      appointment: state.appointment.copyWith(
        name: name,
      ),
    );
  }

  void updateAppointmentTitle(String title) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        title: title,
      ),
    );
  }

  void updateCurrentlyViewingMonth(DateTime newMonth) {
    state = state.copyWith(currentlyViewingMonth: newMonth);
  }

  void viewNextMonth() {
    state = state.copyWith(
      currentlyViewingMonth: state.currentlyViewingMonth.nextMonth,
    );
  }

  void viewPreviousMonth() {
    state = state.copyWith(
      currentlyViewingMonth: state.currentlyViewingMonth.previousMonth,
    );
  }

  void toggleDatePicker() {
    state = state.copyWith(isSelectingDate: !state.isSelectingDate);
  }

  void toggleTimeslotPicker() {
    state = state.copyWith(isSelectingTimeslot: !state.isSelectingTimeslot);
  }

  void previousStage() {
    final int previousStage = state.stage - 1;

    state = state.copyWith(
      stage: previousStage < 0 ? 2 : previousStage,
    );
  }

  void nextStage() {
    final int nextStage = state.stage + 1;

    state = state.copyWith(
      stage: nextStage > 3 ? 1 : nextStage,
      isSelectingDate: state.stage != 0,
      isSelectingTimeslot: state.stage != 0,
    );
  }

  void raiseError(ContactPanelInputType type) {
    if (type == ContactPanelInputType.phoneNumber) {
      state = state.copyWith(phoneNumberError: true);
    } else if (type == ContactPanelInputType.name) {
      state = state.copyWith(nameError: true);
    }
  }
}
