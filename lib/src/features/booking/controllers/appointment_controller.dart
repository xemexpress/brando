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
  }) : currentlyViewingMonth = currentlyViewingMonth ??
            DateTime(appointment.date.year, appointment.date.month);

  Appointment appointment;
  bool isSelectingDate;
  bool isSelectingTimeslot;
  DateTime currentlyViewingMonth;
  int stage; // stage = 0 when selecting date & time; stage = 1 when leaving contact details; stage = 2 when summarising appointment.

  AppointmentState copyWith({
    Appointment? appointment,
    DateTime? currentlyViewingMonth,
    bool? isSelectingDate,
    bool? isSelectingTimeslot,
    int? stage,
  }) {
    return AppointmentState(
      appointment: appointment ?? this.appointment,
      isSelectingDate: isSelectingDate ?? this.isSelectingDate,
      isSelectingTimeslot: isSelectingTimeslot ?? this.isSelectingTimeslot,
      currentlyViewingMonth:
          currentlyViewingMonth ?? this.currentlyViewingMonth,
      stage: stage ?? this.stage,
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

  void updateAppointmentPhoneNumber(String phoneNumber) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void updateAppointmentName(String name) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        name: name,
      ),
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
}
