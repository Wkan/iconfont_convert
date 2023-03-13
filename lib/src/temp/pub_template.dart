import 'dart:convert';
import 'dart:io';

import 'package:iconfont_convert/src/data.dart';
import 'package:yaml/yaml.dart';

class PubTemplate {
  static late List<String> lines;
  static late Map<String, dynamic> pubJson;
  static int _index = 0;

  static void save() async {
    final contents = File("pubspec.yaml").readAsStringSync();
    lines = contents.split('\n');
    pubJson = json.decode(json.encode(loadYaml(contents)));

    await Future.forEach(Data.pubAsserts.keys, ((String k) async {
      build(k, Data.pubAsserts[k]!);
      pubJson = json.decode(json.encode(loadYaml(lines.join("\n"))));
    }));

    File("pubspec.yaml").writeAsStringSync(lines.join("\n"));
  }

  static void build(
    String family,
    List<String> iconfontPath,
  ) {
    _index = 0;

    // flutter:
    if (!pubJson.containsKey("flutter")) {
      lines.add("flutter:");
      pubJson["flutter"] = {};
      _index = lines.length - 1;
    }

    // flutter:
    //   fonts:
    final flutter = pubJson["flutter"] ?? {};
    if (!flutter.containsKey("fonts")) {
      lines.insert(
          _getLineIndex(
            lines,
            "flutter:",
            0,
          ),
          _getIndentString(
            "fonts:",
            1,
          ));
      flutter["fonts"] = [];
    }

    // flutter:
    //   fonts:
    //     - family: xxx
    //       fonts:
    //       - asset: assets/fonts/test_icons/iconfont.ttf
    // print(flutter["fonts"]);
    final fonts = flutter["fonts"] ?? [];
    final iconfont = fonts.firstWhere(
      (e) {
        return e.containsKey("family") && e["family"] == family;
      },
      orElse: () => {},
    );
    if (iconfont.keys.isEmpty) {
      lines.insert(
          _getLineIndex(
            lines,
            "fonts:",
            1,
          ),
          _getIndentString(
            "- family: $family",
            2,
          ));
      iconfont["family"] = family;
    }

    if (!iconfont.containsKey("fonts")) {
      lines.insert(
          _getLineIndex(
            lines,
            "- family: $family",
            2,
          ),
          _getIndentString(
            "fonts:",
            3,
          ));

      iconfont["fonts"] = [];
    }

    final assertContent = _getAssetContent(iconfontPath, iconfont["fonts"]);
    if (assertContent.trim().isNotEmpty) {
      lines.insert(
          _getLineIndex(
            lines,
            "fonts:",
            3,
          ),
          assertContent);
    }
  }

  static String _getAssetContent(List<String> iconfontPath, [List? mFonts]) {
    mFonts ??= [];
    List list = iconfontPath;
    Set set = iconfontPath.toSet()..removeAll(mFonts.map((e) => e['asset']));
    list = set.toList();
    return list.map((e) => _getIndentString('- asset: $e', 4)).join("\n");
  }

  static int _getLineIndex(List<String> lines, String reg, int indent) {
    int line = lines
        .sublist(_index)
        .indexWhere((element) => RegExp("^${_getIndentString(reg, indent)}.*\$").hasMatch(element));

    if (line == -1) {
      throw Exception("pubspec.yaml exception");
    }
    int r = line + 1 + _index;
    _index = r;
    return r;
  }

  static String _getIndentString(String m, int x) {
    var sb = StringBuffer();
    for (var i = 0; i < x; i++) {
      sb.write("  ");
    }
    sb.write(m);
    return sb.toString();
  }
}
