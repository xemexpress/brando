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

      showFeedback(message: S.current.home_profile_displayNameIsUpdated);
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
        showFeedback(message: S.current.home_profile_newPasswordIsTheSame);
      } else {
        showFeedback(message: S.current.home_profile_passwordIsUpdated);
      }
    } on InvalidPasswordAuthException catch (_) {
      showFeedback(message: S.current.home_profile_oldPasswordIsInvalid);
    } on WeakPasswordAuthException catch (_) {
      showFeedback(message: S.current.home_profile_passwordIsTooWeak);
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    }
  }

  void editDisplayName() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: S.of(context).home_profile_editDisplayName,
        hintText: S.of(context).home_profile_enterYourNewDisplayNameHint,
        onSubmit: onSubmitDisplayName,
        capitaliseFirstLetter: true,
      ),
    );
  }

  editEmail() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: S.of(context).home_profile_editEmail,
        hintText: S.of(context).home_profile_enterYourNewEmailHint,
        onSubmit: (email) {
          print('Edit email');
        },
      ),
    );
  }

  editPhoneNumber() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: S.of(context).home_profile_editPhoneNumber,
        hintText: S.of(context).home_profile_enterYourNewPhoneNumberHint,
        onSubmit: (phoneNumber) {
          print('Edit phone number.');
        },
      ),
    );
  }

  editPassword() {
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        title: S.of(context).home_profile_editPassword,
        hintText: S.of(context).home_profile_enterYourOldPasswordHint,
        secondaryHintText: S.of(context).home_profile_enterYourNewPasswordHint,
        onSubmitTwoFields: onSubmitPassword,
        obscureText: true,
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
                  displayText: currentUser?.displayName ??
                      S.of(context).home_profile_howMayIAddressYou,
                  onEdit: editDisplayName,
                ),
                ShowAndEdit(
                  displayText:
                      currentUser?.email ?? S.of(context).home_profile_email,
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
                  displayText: S.of(context).home_profile_pwHidden,
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
