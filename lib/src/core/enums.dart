enum ContactPanelInputType {
  phoneNumber,
  name,
}

enum BookingStage {
  datetime(0),
  contact(1),
  confirmation(2);

  final int code; // Add an index property
  const BookingStage(this.code);

  BookingStage get nextStage {
    final nextIndex = (code + 1) % BookingStage.values.length;
    return BookingStage.values[nextIndex];
  }

  BookingStage get previousStage {
    final previousIndex =
        (index - 1 + BookingStage.values.length) % BookingStage.values.length;
    return BookingStage.values[previousIndex];
  }
}
