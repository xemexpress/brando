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
        const CircleAvatar(
          radius: 40,
          // backgroundImage: NetworkImage(
          //   'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
          // ),
          child: Icon(Icons.person_rounded, size: 60),
        ),

        const SizedBox(width: 20),
        // Profile name
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowAndEdit(
              displayText: 'Mary Cheung',
              onEdit: () {},
            ),
            ShowAndEdit(
              displayText: user.email!,
              onEdit: () {},
              isVerified: true,
            ),
            ShowAndEdit(
              displayText: '57372948',
              onEdit: () {},
            ),
            ShowAndEdit(
              displayText: 'pw: ******',
              onEdit: () {},
            ),
          ],
        ),
      ],
    );
  }
}
