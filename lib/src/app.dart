import 'package:brando/src/features/booking/views/home_screen.dart';
import 'package:brando/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class BrandoApp extends StatelessWidget {
  const BrandoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michelle Yuen Jewelry',
      theme: AppTheme.defaultTheme(),
      home: const HomeScreen(),
    );
  }
}
