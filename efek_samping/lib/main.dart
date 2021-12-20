import 'package:flutter/material.dart';
import 'laporan.dart';
import 'fooderlich_theme.dart';
import 'home.dart';
import 'lapor.dart';
import 'laporan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: Home(),
    );
  }
}
