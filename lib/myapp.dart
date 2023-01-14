import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card Tutorial",
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: home,
    );
  }
}
