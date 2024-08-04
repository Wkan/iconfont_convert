import 'package:args/args.dart';
import 'package:iconfont_convert/iconfont_convert.dart';
import 'package:iconfont_convert/src/iconfont_context.dart';
import 'package:iconfont_convert/src/pub.dart';

import 'helper.dart';

void main(List<String> args) async {
  final ArgParser argParser = ArgParser()
    ..addOption('config',
        abbr: 'c',
        defaultsTo: Constants.pubspecConfig,
        help: "config file path")
    ..addOption('url',
        abbr: 'u',
        help:
            "config css url, auto modify config file, eg: //at.alicdn.com/t/c/font_3292250_zihkyvr4dq.css")
    ..addOption('name', abbr: 'n', help: "if exist multiple icon,to specify icon-name.use with -url.")
    ..addFlag('help', abbr: 'h', negatable: false, help: "help");

  ArgResults argResults = argParser.parse(args);
  if (argResults['help']) {
    print(argParser.usage);
    return;
  }
  try {
    ConvertHelper.parseArgResults(argResults);
    ConvertHelper.modifyIconUrl();
    await IconFontBuilder.buildFromYamlConfig();
    await Pub.save();
    ConvertHelper.modifyIconUrlToFile?.call();
  } catch (e, s) {
    print(e.toString());
    if(e is ConvertException){
      return;
    }
    print(s.toString());
  }
}
