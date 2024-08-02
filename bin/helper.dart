import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:iconfont_convert/iconfont_convert.dart';
import 'package:iconfont_convert/src/iconfont_context.dart';
import 'package:yaml/yaml.dart';

class ConvertHelper {
  /// Modify after execution is completed
  static Function? modifyIconUrlToFile;

  /// Check args and temporary modify url
  static modifyIconUrl() {
    if (context.url.isEmpty == true) {
      return;
    }
    final allIcons = <IconFontYamlConfigItem>[];
    for (var element in context.iconFonts) {
      element["icons"].forEach((element) {
        allIcons.add(IconFontYamlConfigItem.fromJson(element));
      });
    }
    if (allIcons.isEmpty) {
      throw ConvertException("please config iconFont in pubspec.yaml");
    }
    final IconFontYamlConfigItem? targetIcon;
    if (context.name.isEmpty == true) {
      if(allIcons.length>1){
        throw ConvertException("please use -n set icon_name,because has multiple icon!");
      }
      targetIcon = allIcons.first;
    } else {
      targetIcon = allIcons.firstWhereOrNull(
          (element) => element.iconName == context.name);
    }
    if (targetIcon == null) {
      throw ConvertException("can not find icon");
    }
    final oldUrl = targetIcon.url;
    targetIcon.oriData["url"] = context.url;
    if (oldUrl != context.url) {
      print(
          "replace ${targetIcon.iconName} url from $oldUrl to ${context.url}");
    }
    modifyIconUrlToFile = () {
      final configFile = File(context.config);
      final contents = configFile.readAsStringSync();
      var lines = contents.split('\n');
      final index = lines.indexWhere((element) => element.contains(oldUrl!));
      lines[index] = lines[index].replaceAll(RegExp(":.*"), ": ${context.url}");
      configFile.writeAsStringSync(lines.join("\n"));
    };
  }

  static parseArgResults(argResults) {
    context = Args(argResults['name'] ?? "", argResults['url'] ?? "",
        argResults['config'] ?? Constants.pubspecConfig);
    final configFile = File(context.config);
    if (!configFile.existsSync()) {
      throw ConvertException("config file is not exist");
    }
    final yamlConfig =
        jsonDecode(jsonEncode(loadYaml(configFile.readAsStringSync())));
    context.configJson = yamlConfig;
  }
}
