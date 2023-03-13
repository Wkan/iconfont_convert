import 'dart:convert';
import 'dart:io';

import 'package:iconfont_convert/src/iconfont_data.dart';
import 'package:iconfont_convert/src/pub.dart';
import 'package:iconfont_convert/src/temp/icon_template.dart';
import 'package:iconfont_convert/src/utils.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

import 'constants.dart';
import 'iconfont_config.dart';

class IconFontBuilder {
  static _build(IconFontConfig config) async {
    if (config.url.isNotEmpty) {
      final iconFontData = await IconFontData.from(config);

      _saveIconClass(config, iconFontData);
    }
  }

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

  static buildFromYamlConfig(String configPath) async {
    var yamlConfig = jsonDecode(jsonEncode(loadYaml(File(configPath).readAsStringSync())));

    if (path.basename(configPath) == Constants.pubspecConfig) {
      yamlConfig = yamlConfig["iconfont"] ?? [];
    }

    await Future.forEach(yamlConfig, (e) async {
      final c = IconFontYamlConfig.fromJson(jsonDecode(jsonEncode(e)));
      await Future.forEach<IconFontYamlConfigItem>(c.icons ?? [], (configItem) async {
        if (configItem.url == null || configItem.url!.isEmpty) {
          throw ArgumentError("url is empty");
        }

        if (configItem.iconName == null || configItem.iconName!.isEmpty) {
          throw ArgumentError("icon_name is empty");
        }

        if (configItem.iconClass == null || configItem.iconClass!.isEmpty) {
          configItem.iconClass = Utils.camel(configItem.iconName!, pascalCase: true);
        }

        await _build(IconFontConfig(
          url: configItem.url!,
          iconName: configItem.iconName!,
          iconClass: configItem.iconClass!,
          fontPackage: configItem.package,
          fontAssetsPath: c.fontAssetsPath ?? Constants.defaultFontAssetsPath,
          iconClassPath: c.iconClassPath ?? Constants.defaultWritePath,
        ));
      });
    });
  }

  // static scanAndPubSave() async {
  //   await IconFontScanner.scan();
  //   await Pub.save();
  // }
}
