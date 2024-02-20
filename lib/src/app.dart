import 'package:brando/src/features/booking/views/home_screen.dart';
import 'package:brando/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class BrandoApp extends StatefulWidget {
  const BrandoApp({
    super.key,
  });

  @override
  State<BrandoApp> createState() => _BrandoAppState();
}

class _BrandoAppState extends State<BrandoApp> with WidgetsBindingObserver {
  // late ThemeModeNotifier _themeModeNotifier;
  late final WidgetsBinding _widgetsBinding;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);

    // Init the app's brightness here

    super.initState();
  }

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // Update the app's brightness here

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michelle Yuen Jewelry',
      theme: AppTheme.defaultTheme,
      home: const HomeScreen(),
    );
  }
}
