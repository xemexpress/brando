import 'package:brando/generated/l10n.dart';
import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileScaffold extends ConsumerStatefulWidget {
  const MobileScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  ConsumerState<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends ConsumerState<MobileScaffold> {
  void logOut() async {
    try {
      await ref.read(authControllerProvider.notifier).signOut();
    } on GenericAuthException catch (e) {
      showFeedback(message: e.message);
    } catch (e) {
      showFeedback(message: e.toString());
    }
  }

  void goToHomePage() {
    Navigator.of(context).pop();
    ref.read(appointmentControllerProvider.notifier).resetStage();
    print(
        'test ModalRoute.of(context)?.settings.name: ${ModalRoute.of(context)?.settings.name}');
    if (ModalRoute.of(context)?.settings.name != AuthScreen.routeName) {
      Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).colorScheme.background,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'My appointment',
                style: GoogleFonts.openSans(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: goToHomePage,
            ),
            const SizedBox(height: 10),
            // DrawerItem(
            //   title: Text(
            //     'Language',
            //     style: GoogleFonts.openSans(
            //       textStyle: Theme.of(context).textTheme.titleLarge,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onTap: () {
            //     print('Change Language');
            //   },
            // ),
            // DrawerItem(title: ,),
            const Spacer(),
            ListTile(
                title: Text(
                  S.of(context).common_logoutButton,
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: logOut),
            Divider(
              indent: 17,
              endIndent: 17,
              color: Theme.of(context).colorScheme.onPrimary,
              thickness: 0.5,
            ),
            const SizedBox(height: 5),
            const Center(
              child: AffiliationNote(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
