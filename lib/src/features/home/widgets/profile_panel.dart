import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePanel extends StatelessWidget {
  ProfilePanel({
    super.key,
  });

  final user = FirebaseAuth.instance.currentUser!;

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
            child: const Icon(Icons.person_rounded, size: 60),
          ),
        ),

        const SizedBox(width: 20),
        // Profile name
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowAndEdit(
              displayText: 'Mary Cheung',
              onEdit: () {
                print('Edit username.');
              },
            ),
            ShowAndEdit(
              displayText: user.email!,
              onEdit: () {
                print('Edit username.');
              },
              isVerified: true,
            ),
            ShowAndEdit(
              displayText: '57372948',
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
