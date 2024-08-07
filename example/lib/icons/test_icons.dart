//  This file is automatically generated. DO NOT EDIT, all your changes would be lost.
//  https://pub.dartlang.org/packages/iconfont_convert

import 'package:flutter/material.dart';

class TestIcons {
  static const String _family = 'iconfont';
  
  TestIcons._();
  
  static const IconData ci = IconData(0xe77e, fontFamily: _family); // CI
  static const IconData compass = IconData(0xe780, fontFamily: _family); // compass
  static const IconData close_circle = IconData(0xe781, fontFamily: _family); // close-circle
  static const IconData info_circle = IconData(0xe783, fontFamily: _family); // info-circle
  static const IconData left_circle = IconData(0xe784, fontFamily: _family); // left-circle
  static const IconData down_circle = IconData(0xe785, fontFamily: _family); // down-circle
  static const IconData copyright = IconData(0xe787, fontFamily: _family); // copyright
  static const IconData minus_circle = IconData(0xe788, fontFamily: _family); // minus-circle
  static const IconData plus_circle = IconData(0xe78a, fontFamily: _family); // plus-circle
  static const IconData play_circle = IconData(0xe78b, fontFamily: _family); // play-circle
  static const IconData question_circle = IconData(0xe78c, fontFamily: _family); // question-circle
  static const IconData right_circle = IconData(0xe78e, fontFamily: _family); // right-circle
  static const IconData smile = IconData(0xe78f, fontFamily: _family); // smile
  static const IconData trademark = IconData(0xe790, fontFamily: _family); // trademark
  static const IconData time_circle = IconData(0xe791, fontFamily: _family); // time-circle
  static const IconData timeout = IconData(0xe792, fontFamily: _family); // time out
  static const IconData earth = IconData(0xe793, fontFamily: _family); // earth
  static const IconData up_circle = IconData(0xe795, fontFamily: _family); // up-circle
  static const IconData warning_circle = IconData(0xe796, fontFamily: _family); // warning-circle
  static const IconData sync = IconData(0xe797, fontFamily: _family); // sync
  static const IconData undo = IconData(0xe799, fontFamily: _family); // undo
  static const IconData message = IconData(0xe79d, fontFamily: _family); // message
  static const IconData dashboard = IconData(0xe79e, fontFamily: _family); // dashboard
  static const IconData setting = IconData(0xe7a3, fontFamily: _family); // setting
  static const IconData location = IconData(0xe7a5, fontFamily: _family); // location
  static const IconData save = IconData(0xe7a8, fontFamily: _family); // save
  static const IconData appstore = IconData(0xe7aa, fontFamily: _family); // app store
  static const IconData codelibrary = IconData(0xe7b1, fontFamily: _family); // code library
}

class _PreviewIcon {
  const _PreviewIcon(this.icon, this.name, this.propName);

  final IconData icon;
  final String name;
  final String propName;
}

class TestIconsPreview extends StatelessWidget {
  const TestIconsPreview({Key? key}) : super(key: key);

  static const iconList = <_PreviewIcon>[
    _PreviewIcon(TestIcons.ci, "ci", "CI"),
    _PreviewIcon(TestIcons.compass, "compass", "compass"),
    _PreviewIcon(TestIcons.close_circle, "close_circle", "close-circle"),
    _PreviewIcon(TestIcons.info_circle, "info_circle", "info-circle"),
    _PreviewIcon(TestIcons.left_circle, "left_circle", "left-circle"),
    _PreviewIcon(TestIcons.down_circle, "down_circle", "down-circle"),
    _PreviewIcon(TestIcons.copyright, "copyright", "copyright"),
    _PreviewIcon(TestIcons.minus_circle, "minus_circle", "minus-circle"),
    _PreviewIcon(TestIcons.plus_circle, "plus_circle", "plus-circle"),
    _PreviewIcon(TestIcons.play_circle, "play_circle", "play-circle"),
    _PreviewIcon(TestIcons.question_circle, "question_circle", "question-circle"),
    _PreviewIcon(TestIcons.right_circle, "right_circle", "right-circle"),
    _PreviewIcon(TestIcons.smile, "smile", "smile"),
    _PreviewIcon(TestIcons.trademark, "trademark", "trademark"),
    _PreviewIcon(TestIcons.time_circle, "time_circle", "time-circle"),
    _PreviewIcon(TestIcons.timeout, "timeout", "time out"),
    _PreviewIcon(TestIcons.earth, "earth", "earth"),
    _PreviewIcon(TestIcons.up_circle, "up_circle", "up-circle"),
    _PreviewIcon(TestIcons.warning_circle, "warning_circle", "warning-circle"),
    _PreviewIcon(TestIcons.sync, "sync", "sync"),
    _PreviewIcon(TestIcons.undo, "undo", "undo"),
    _PreviewIcon(TestIcons.message, "message", "message"),
    _PreviewIcon(TestIcons.dashboard, "dashboard", "dashboard"),
    _PreviewIcon(TestIcons.setting, "setting", "setting"),
    _PreviewIcon(TestIcons.location, "location", "location"),
    _PreviewIcon(TestIcons.save, "save", "save"),
    _PreviewIcon(TestIcons.appstore, "appstore", "app store"),
    _PreviewIcon(TestIcons.codelibrary, "codelibrary", "code library"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestIcons'),
      ),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: iconList.map((e) {
          return InkWell(
            onTap: () {
              //
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Icon(e.icon),
                ),
                Text(e.name, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
                Text(e.propName, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
