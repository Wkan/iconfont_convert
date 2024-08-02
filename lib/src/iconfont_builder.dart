import 'dart:convert';

import 'package:iconfont_convert/src/iconfont_data.dart';
import 'package:iconfont_convert/src/pub.dart';
import 'package:iconfont_convert/src/temp/icon_template.dart';
import 'package:iconfont_convert/src/utils.dart';

import 'constants.dart';
import 'iconfont_config.dart';
import 'iconfont_context.dart';

/// 构建图标文件
class IconFontBuilder {
  static _build(IconFontConfig config) async {
    if (config.url.isNotEmpty) {
      final iconFontData = await IconFontData.from(config);

      _saveIconClass(config, iconFontData);
    }
  }

  /// 保存图标类
  static _saveIconClass(IconFontConfig config, IconFontData data) {
    String content = IconTemplate.build(config.iconClass, data);

    final ttfSavePath = config.ttfSavePath;
    final iconClassSavePath = config.iconClassSavePath;

    if (data.fontFamily.isEmpty) {
      throw ArgumentError("fontFamily is empty");
    }

    Pub.addAssert(data.fontFamily, ttfSavePath);
    Utils.writeToFile(iconClassSavePath, content);
  }

  /// 从 yaml 配置构建
  static buildFromYamlConfig() async {
    for (var element in context.iconFonts) {
      await buildIconFontConfig(element);
    }
  }

  static Future<void> buildIconFontConfig(Object? e) async {
    final c = IconFontYamlConfig.fromJson(jsonDecode(jsonEncode(e)));
    for (final configItem in c.icons ?? []) {
      if (configItem.url == null || configItem.url!.isEmpty) {
        throw ConvertException("url is empty");
      }

      if (configItem.iconName == null || configItem.iconName!.isEmpty) {
        throw ConvertException("icon_name is empty");
      }

      if (configItem.iconClass == null || configItem.iconClass!.isEmpty) {
        configItem.iconClass =
            Utils.camel(configItem.iconName!, pascalCase: true);
      }

      await _build(IconFontConfig(
        url: configItem.url!,
        iconName: configItem.iconName!,
        iconClass: configItem.iconClass!,
        fontFamily: configItem.fontFamily,
        fontPackage: configItem.package,
        fontAssetsPath: c.fontAssetsPath ?? Constants.defaultFontAssetsPath,
        iconClassPath: c.iconClassPath ?? Constants.defaultWritePath,
      ));
    }
  }
}
