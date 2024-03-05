import 'package:brando/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ConsumerStateExtension on ConsumerState {
  void showFeedback({required String message}) {
    showMySnackBar(context: context, message: message);
  }
}
