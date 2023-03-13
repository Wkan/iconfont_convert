import 'package:flutter/material.dart';
import 'package:iconfont_convert_example/icons/test_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconfont Convert Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestIconsPreview(),
    );
  }
}
