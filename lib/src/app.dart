import 'package:flutter/material.dart';

class BrandoApp extends StatelessWidget {
  const BrandoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michelle Yuen Jewelry',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Michelle Yuen Jewelry'),
        ),
      ),
    );
  }
}
