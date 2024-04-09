// import 'package:brando/src/core/core.dart';
// import 'package:flutter/material.dart';

// class ResponsiveLayout extends StatelessWidget {
//   const ResponsiveLayout({
//     super.key,
//     required this.mobileScaffold,
//     required this.tabletScaffold,
//     required this.desktopScaffold,
//   });

//   final Widget mobileScaffold;
//   final Widget tabletScaffold;
//   final Widget desktopScaffold;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final String screen = context.responsive(
//           'Default',
//           lg: 'Desktop (lg)',
//           md: 'Tablet (md)',
//           sm: 'Mobile (sm)',
//         );

//         return Stack(
//           children: [
//             context.responsive(
//               mobileScaffold,
//               lg: desktopScaffold,
//               md: tabletScaffold,
//               sm: mobileScaffold,
//             ),
//             Center(
//               child: Text(
//                 '$screen width: ${constraints.maxWidth}',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
