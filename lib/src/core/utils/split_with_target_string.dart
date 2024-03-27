List<String> splitWithTargetString(String localizedString, String target) {
  // Regular expression for splitting
  RegExp regExp = RegExp('(?<=$target)|(?=$target)');

  // Splitting the string
  List<String> parts =
      localizedString.split(regExp).where((part) => part.isNotEmpty).toList();

  return parts;
}
