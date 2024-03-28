import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePanel extends ConsumerStatefulWidget {
  const ProfilePanel({
    super.key,
  });

  @override
  ConsumerState<ProfilePanel> createState() => _ProfilePanelState();
}

class _ProfilePanelState extends ConsumerState<ProfilePanel> {
  void pop() {
    Navigator.of(context).pop();
  }

  void onSubmitDisplayName(String newDisplayName) async {
    try {
      pop();

      await ref
          .read(authControllerProvider.notifier)
          .updateDisplayName(displayName: newDisplayName);

      showFeedback(message: 'Display name is updated!');
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void onSubmitPassword(String oldPassword, String newPassword) async {
    try {
      pop();
      await ref.read(authControllerProvider.notifier).updatePassword(
            oldPassword: oldPassword,
            newPassword: newPassword,
          );

      if (oldPassword == newPassword) {
        showFeedback(message: 'New password is the same as the old password.');
      } else {
        showFeedback(message: 'Password is updated!');
      }
    } on InvalidPasswordAuthException catch (_) {
      showFeedback(message: 'Old password is invalid. Please try again.');
    } on WeakPasswordAuthException catch (_) {
      showFeedback(message: 'Password is too weak. Please try again.');
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void editDisplayName() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: 'Edit Display Name',
        hintText: 'Enter your new display name',
        onSubmit: onSubmitDisplayName,
        capitaliseFirstLetter: true,
      ),
    );
  }

  editPassword() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: 'Edit Password',
        hintText: 'Enter your old password',
        secondaryHintText: 'Enter your new password',
        onSubmitTwoFields: onSubmitPassword,
        obscureText: true,
      ),
    );
  }

  editPhoneNumber() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: 'Edit Phone Number',
        hintText: 'Enter your new phone number',
        onSubmit: (phoneNumber) {
          print('Edit phone number.');
        },
      ),
    );
  }

  editEmail() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: 'Edit Email',
        hintText: 'Enter your new email',
        onSubmit: (email) {
          print('Edit email');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.read(authControllerProvider.notifier).userChanges(),
      builder: (context, snapshot) {
        final AuthUser? currentUser = snapshot.data;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 41.0,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundImage: currentUser?.photoURL != null
                    ? NetworkImage(
                        currentUser!.photoURL!,
                      )
                    : null,
                child: currentUser?.photoURL != null
                    ? null
                    : const Icon(
                        Icons.person_rounded,
                        size: 60,
                      ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowAndEdit(
                  displayText:
                      currentUser?.displayName ?? 'How may I address you?',
                  onEdit: editDisplayName,
                ),
                ShowAndEdit(
                  displayText: currentUser?.email ?? 'Email',
                  // onEdit: editEmail,
                  isVerified: true,
                ),
                ShowAndEdit(
                  displayText: currentUser?.phoneNumber != null
                      ? "+852 ${currentUser?.phoneNumber}"
                      : S.of(context).home_profile_phoneNumberNotAvailable,
                  // onEdit: editPhoneNumber,
                ),
                ShowAndEdit(
                  displayText: 'pw: ******',
                  onEdit: editPassword,
                ),
              ],
            ),
          ],
        );
        // } else {
        //   return const CircularProgressIndicator();
        // }
      },
    );
  }
}
