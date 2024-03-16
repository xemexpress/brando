import 'package:brando/src/common/common.dart';
import 'package:brando/src/features/appointment/controllers/controllers.dart';
import 'package:brando/src/features/home/controllers/controllers.dart';
import 'package:brando/src/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) async {
  //       // final result = await ref
  //       //     .read(appointmentControllerProvider.notifier)
  //       //     .currentAppointment();

  //       final result = await ref.read(currentAppointmentProvider.future);

  //       if (result != null) {
  //         ref
  //             .read(appointmentControllerProvider.notifier)
  //             .updateAppointment(result);
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // return context.responsive(
    //   const MobileScaffold(
    //     body: LogInPage(),
    //   ),
    //   md: const DesktopScaffold(
    //     leftSide: PrimarySection(
    //       child: WelcomeSign(),
    //     ),
    //     rightSide: LogInPage(),
    //   ),
    // );

    return const ResponsiveLayout(
      mobileScaffold: MobileScaffold(
        body: HomePage(),
      ),
      tabletScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          isShadowed: true,
          child: WelcomeSign(),
        ),
        rightSide: HomePage(),
      ),
      desktopScaffold: DesktopScaffold(
        leftSide: PrimarySection(
          isShadowed: true,
          child: WelcomeSign(),
        ),
        rightSide: HomePage(),
      ),
    );
  }
}
