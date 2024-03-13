import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:brando/src/models/models.dart';
import 'package:flutter/material.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({
    super.key,
    required this.currentUser,
  });

  final AuthUser? currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile picture
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
        // Profile name
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowAndEdit(
              displayText: currentUser?.displayName ?? 'How may I address you?',
              onEdit: () {
                print('Edit username.');
              },
            ),
            ShowAndEdit(
              displayText: currentUser?.email ?? 'Email',
              onEdit: () {
                print('Edit username.');
              },
              isVerified: true,
            ),
            ShowAndEdit(
              displayText: currentUser?.phoneNumber != null
                  ? "+852 ${currentUser?.phoneNumber}"
                  : "Phone number not available",
              // '+ 852 '
              onEdit: () {
                print('Edit mobile number.');
              },
            ),
            ShowAndEdit(
              displayText: 'pw: ******',
              onEdit: () {
                print('Edit password.');
              },
            ),
          ],
        ),
      ],
    );
  }
}
