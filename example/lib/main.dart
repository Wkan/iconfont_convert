import 'package:flutter/material.dart';
import 'package:iconfont_convert_example/icons/test_icons.dart';
import 'package:other_package/icons/other_test_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  final _previewPages = <Widget>[
    const TestIconsPreview(),
    const OtherTestIconsPreview(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconfont Convert Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: _previewPages[_currentTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTabIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(TestIcons.appstore),
                label: 'Example Icon',
              ),
              BottomNavigationBarItem(
                icon: Icon(OtherTestIcons.faxian),
                label: 'Other Package Icon',
              ),
            ],
          )),
    );
  }
}
