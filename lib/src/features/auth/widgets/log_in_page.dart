import 'package:brando/src/apis/apis.dart';
import 'package:brando/src/common/common.dart';
import 'package:brando/src/core/core.dart';
import 'package:brando/src/features/auth/controllers/controllers.dart';
import 'package:brando/src/features/auth/view/auth_screen.dart';
import 'package:brando/src/features/auth/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({super.key});

  @override
  ConsumerState<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    final Widget logInBody = Container(
      padding: context.responsive(
        const EdgeInsets.symmetric(horizontal: 40),
        sm: const EdgeInsets.symmetric(horizontal: 170),
        md: const EdgeInsets.symmetric(horizontal: 80),
        lg: const EdgeInsets.symmetric(horizontal: 135),
        xl: const EdgeInsets.symmetric(horizontal: 200),
      ),
      child: const LogInPanel(),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        context.responsive(
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 42.0),
                  child: WelcomeSign(),
                ),
                logInBody,
                const SizedBox(height: 100),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: AffiliationNote(),
                ),
              ],
            ),
          ),
          md: Align(
            alignment: Alignment.center,
            child: logInBody,
          ),
        ),
        if (isLoading) ...[
          const LoaderBackground(),
          const Loader(),
        ],
        // context.responsive(
        //   const Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       // Padding(
        //       //   padding: EdgeInsets.only(top: 38.0),
        //       //   child: WelcomeSign(),
        //       // ),
        //       Padding(
        //         padding: EdgeInsets.only(bottom: 20.0),
        //         child: AffiliationNote(),
        //       ),
        //     ],
        //   ),
        //   md: Container(),
        // ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       const SizedBox(height: 60),
        // const WelcomeSign(),
        //       const SizedBox(height: 60),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
