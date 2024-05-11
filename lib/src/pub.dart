import 'temp/pub_template.dart';

class Pub {
  /// pubspec 文件列出的资源文件
  static Map<String, List<String>> pubAsserts = {};

  static addAssert(String family, String ttfPath) {
    if (pubAsserts.containsKey(family)) {
      pubAsserts[family]!.add(ttfPath);
    } else {
      pubAsserts[family] = [ttfPath];
    }
  }

  static save() async {
    PubTemplate.save();
  }
}
