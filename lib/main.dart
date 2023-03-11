import 'package:flutter/material.dart';
import 'AppBarPlanner.dart';

List<String> titles = <String>[
  'Timers',
  'Alarms',
  'Tasks',
  'Settings',
];

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const AppBarPlanner(),
    );
  }
}





