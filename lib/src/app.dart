import 'package:brando/src/features/auth/views/log_in_screen.dart';
import 'package:brando/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrandoApp extends ConsumerStatefulWidget {
  const BrandoApp({
    super.key,
  });

  @override
  ConsumerState<BrandoApp> createState() => _BrandoAppState();
}

class _BrandoAppState extends ConsumerState<BrandoApp>
    with WidgetsBindingObserver {
  late final WidgetsBinding _widgetsBinding;

  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = _widgetsBinding.platformDispatcher.platformBrightness;

    ref
        .read(themeControllerProvider.notifier)
        .changeBrightness(brightness: brightness);

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeControllerProvider);

    return MaterialApp(
      title: 'Michelle Yuen Jewelry',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.currentTheme(
        brightness: themeState.appBrightness,
      ),
      home: const LogInScreen(),
    );
  }
}
