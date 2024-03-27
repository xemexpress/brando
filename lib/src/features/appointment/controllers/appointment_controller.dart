import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/apis/appointment/appointment.dart';
import 'package:brando/src/apis/appointment/appointment_api.dart';
import 'package:brando/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:brando/src/models/models.dart';

class AppointmentState {
  AppointmentState({
    required this.appointment,
    required this.isSelectingDate,
    required this.isSelectingTimeslot,
    required this.createNew,
    DateTime? currentlyViewingMonth,
    this.isLoading = false,
    this.stage = BookingStage.datetime,
    this.phoneNumberError = false,
    this.nameError = false,
  }) : currentlyViewingMonth = currentlyViewingMonth ??
            DateTime(appointment.date.year, appointment.date.month);

  final Appointment appointment;
  final bool isLoading;
  final BookingStage stage;
  final bool createNew;

  // Stage 1
  final bool isSelectingDate;
  final bool isSelectingTimeslot;
  final DateTime currentlyViewingMonth;

  // Stage 2
  final bool phoneNumberError;
  final bool nameError;

  AppointmentState copyWith({
    Appointment? appointment,
    bool? createNew,
    BookingStage? stage,
    bool? isLoading,
    bool? isSelectingDate,
    bool? isSelectingTimeslot,
    DateTime? currentlyViewingMonth,
    bool? phoneNumberError,
    bool? nameError,
  }) {
    return AppointmentState(
      appointment: appointment ?? this.appointment,
      createNew: createNew ?? this.createNew,
      stage: stage ?? this.stage,
      isLoading: isLoading ?? this.isLoading,
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
  final AuthAPI _authAPI;
  final AppointmentAPI _appointmentAPI;

  AppointmentController({
    required AuthAPI authAPI,
    required AppointmentAPI appointmentAPI,
    required Appointment appointment,
    required bool createNew,
  })  : _authAPI = authAPI,
        _appointmentAPI = appointmentAPI,
        super(
          AppointmentState(
            appointment: appointment,
            createNew: createNew,
            isSelectingDate: true,
            isSelectingTimeslot: true,
          ),
        );

  void isLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void isCreatingNew(bool createNew) {
    state = state.copyWith(createNew: createNew);
  }

  // ************** Firestore related **************

  Stream<Appointment?> currentAppointmentStream() {
    return _appointmentAPI.currentAppointmentStream(
      userId: _authAPI.currentUser!.id,
    );
  }

  Future<Appointment?> currentAppointment() async {
    isLoading(true);
    try {
      final Appointment? appointment = await _appointmentAPI.currentAppointment(
          userId: _authAPI.currentUser!.id);

      if (appointment != null) {
        isCreatingNew(false);
      }

      return appointment;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> isAppointmentAvailable() async {
    isLoading(true);

    try {
      final bool isAvailable = await _appointmentAPI.checkAvailability(
        userId: _authAPI.currentUser!.id,
        appointmentId: state.appointment.appointmentId,
      );

      return isAvailable;
    } finally {
      isLoading(false);
    }
  }

  Future<void> bookAppointment() async {
    isLoading(true);

    try {
      final AuthUser currentUser = _authAPI.currentUser!;

      await _appointmentAPI.book(
        userId: currentUser.id,
        appointment: state.appointment,
        createNew: state.createNew,
      );

      // Update the user's profile
      if (currentUser.displayName == null) {
        await _authAPI.updateDisplayName(
          newDisplayName: state.appointment.name,
        );
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> cancelAppointment() async {
    isLoading(true);

    try {
      await _appointmentAPI.cancelAppointment(userId: _authAPI.currentUser!.id);

      isCreatingNew(true);
    } finally {
      isLoading(false);
    }
  }
// ************** Firestore related (above) **************

  // Local edits
  void localUpdateAppointment(Appointment? appointment) {
    state = state.copyWith(
      appointment: appointment ?? state.appointment,
      currentlyViewingMonth: DateTime(
        appointment?.date.year ?? state.currentlyViewingMonth.year,
        appointment?.date.month ?? state.currentlyViewingMonth.month,
      ),
    );

    isCreatingNew(appointment == null);
  }

  void localUpdateAppointmentDate(DateTime date) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        date: date,
      ),
      currentlyViewingMonth: date,
      isSelectingDate: false,
    );
  }

  void localUpdateAppointmentTimeslot(
      (TimeOfDay startTime, TimeOfDay endTime) timeslot) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        startTime: timeslot.$1,
        endTime: timeslot.$2,
      ),
      isSelectingTimeslot: false,
    );
  }

  void localUpdateAppointmentPhoneNumber(String phoneNumber) {
    state = state.copyWith(
      phoneNumberError: false,
      appointment: state.appointment.copyWith(
        phoneNumber: phoneNumber,
      ),
    );
  }

  void localUpdateAppointmentName(String name) {
    state = state.copyWith(
      nameError: false,
      appointment: state.appointment.copyWith(
        name: name,
      ),
    );
  }

  void localUpdateAppointmentTitle(String title) {
    state = state.copyWith(
      appointment: state.appointment.copyWith(
        title: title,
      ),
    );
  }

  void finishSelectingDateTime() {
    state = state.copyWith(
      isSelectingDate: false,
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

  void resetStage() {
    state = state.copyWith(
      stage: BookingStage.datetime,
      isSelectingDate: true,
      isSelectingTimeslot: true,
    );
  }

  void previousStage() {
    state = state.copyWith(
      stage: state.stage.previousStage,
      isSelectingDate: state.stage.previousStage == BookingStage.datetime,
      isSelectingTimeslot: state.stage.previousStage == BookingStage.datetime,
    );
  }

  void nextStage() {
    state = state.copyWith(
      stage: state.stage.nextStage,
      isSelectingDate: state.stage.nextStage == BookingStage.datetime,
      isSelectingTimeslot: state.stage.nextStage == BookingStage.datetime,
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
