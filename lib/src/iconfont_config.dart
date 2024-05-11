import 'package:path/path.dart' as path;

/// 构建图标字体的配置信息
class IconFontConfig {
  final String fontAssetsPath;
  final String iconClassPath;
  final String iconName;
  final String iconClass;
  final String url;
  final String? fontPackage;

  const IconFontConfig({
    required this.fontAssetsPath,
    required this.iconClassPath,
    required this.iconName,
    required this.iconClass,
    required this.url,
    this.fontPackage,
  });

  /// 保存字体文件的路径
  String get ttfSavePath {
    final filename = "$iconName.ttf";
    return path.joinAll([fontAssetsPath, filename]);
  }

  /// 保存icon类的路径
  String get iconClassSavePath {
    final filename = "$iconName.dart";
    return path.joinAll([iconClassPath, filename]);
  }
}

/// 从 yaml 文件中解析出的配置信息
class IconFontYamlConfig {
  String? fontAssetsPath;
  String? iconClassPath;
  List<IconFontYamlConfigItem>? icons;

  IconFontYamlConfig({this.fontAssetsPath, this.iconClassPath, this.icons});

  IconFontYamlConfig.fromJson(Map<String, dynamic> json) {
    fontAssetsPath = json['font_assets_path'];
    iconClassPath = json['icon_class_path'];
    if (json['icons'] != null) {
      icons = <IconFontYamlConfigItem>[];
      json['icons'].forEach((v) {
        icons!.add(IconFontYamlConfigItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['font_assets_path'] = fontAssetsPath;
    data['icon_class_path'] = iconClassPath;
    if (icons != null) {
      data['icons'] = icons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 单个图标字体配置信息
class IconFontYamlConfigItem {
  String? url;
  String? iconName;
  String? iconClass;
  String? package;

  IconFontYamlConfigItem({
    this.url,
    this.iconName,
    this.iconClass,
    this.package,
  });

  IconFontYamlConfigItem.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    iconName = json['icon_name'];
    iconClass = json['icon_class'];
    package = json['package'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = url;
    data['icon_name'] = iconName;
    data['icon_class'] = iconClass;
    data['package'] = package;
    return data;
  }
}
