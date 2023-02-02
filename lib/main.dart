import 'package:flutter/material.dart';
import 'package:grobox/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grobox',
      theme: ThemeData(
        primarySwatch: const MaterialColor(4285881268, {
          50: Color(0xfff0eef7),
          100: Color(0xffe2dcef),
          200: Color(0xffc4b9df),
          300: Color(0xffa796cf),
          400: Color(0xff8973bf),
          500: Color(0xff6c50af),
          600: Color(0xff56408c),
          700: Color(0xff413069),
          800: Color(0xff2b2046),
          900: Color(0xff161023)
        }),
        scaffoldBackgroundColor: const Color(0xfffbfbfd),
      ),
      home: const HomeScreen(),
    );
  }
}
