import 'dart:convert';

import 'package:iconfont_convert/src/utils.dart';

import '../iconfont_convert.dart';

/// 图标字体数据
class IconFontData {
  String id;
  String name;
  String fontFamily;
  String cssPrefixText;
  String description;
  List<IconFontGlyph> glyphs;
  String? fontPackage;

  IconFontData({
    required this.id,
    required this.name,
    required this.fontFamily,
    this.description = "",
    this.cssPrefixText = "",
    this.glyphs = const [],
    this.fontPackage,
  });

  factory IconFontData.fromJson(Map<String, dynamic> json) {
    final glyphs = <IconFontGlyph>[];
    final jsonGlyphs = json['glyphs'];
    if (jsonGlyphs is List) {
      for (var json in jsonGlyphs) {
        glyphs.add(IconFontGlyph.fromJson(json));
      }
    }

    return IconFontData(
      id: json['id'],
      name: json['name'] ?? "Untitled",
      fontFamily: json['font_family']!,
      description: json['description'] ?? "",
      cssPrefixText: json['css_prefix_text'] ?? "",
      glyphs: glyphs,
      fontPackage: json['font_package'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['font_family'] = fontFamily;
    data['description'] = description;
    data['css_prefix_text'] = cssPrefixText;
    data['glyphs'] = glyphs.map((v) => v.toJson()).toList();
    data['font_package'] = fontPackage;
    return data;
  }

  static Future<IconFontData> from(IconFontConfig config) async {
    final jsonUrl = config.url
        .replaceAll(r"?.*", "")
        .replaceAll(RegExp(r"\.(js|css|ttf)$"), ".json");
    final ttfUrl = jsonUrl.replaceAll(RegExp(r"\.json$"), ".ttf");

    print("download json content from $jsonUrl");
    final jsonContent = await Utils.httpGetContent(jsonUrl);

    final ttfSavePath = config.ttfSavePath;

    print("download ttf file from $ttfUrl to $ttfSavePath");
    await Utils.downloadToFile(ttfSavePath, ttfUrl);

    return IconFontData.fromJson(json.decode(jsonContent))
      ..fontPackage = config.fontPackage;
  }
}

class IconFontGlyph {
  String? iconId;
  String? fontClass;
  String? unicode;
  int? unicodeDecimal;
  String? name;

  IconFontGlyph({
    this.iconId,
    this.fontClass,
    this.unicode,
    this.unicodeDecimal,
    this.name,
  });

  IconFontGlyph.fromJson(Map<String, dynamic> json) {
    iconId = json['icon_id'];
    fontClass = json['font_class'];
    unicode = json['unicode'];
    unicodeDecimal = json['unicode_decimal'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon_id'] = iconId;
    data['font_class'] = fontClass;
    data['unicode'] = unicode;
    data['unicode_decimal'] = unicodeDecimal;
    data['name'] = name;
    return data;
  }
}
