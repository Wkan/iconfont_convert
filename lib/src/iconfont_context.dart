
import 'package:path/path.dart' as path;
import '../iconfont_convert.dart';


class ConvertException implements Exception {
  final dynamic message;

  ConvertException([this.message]);

  @override
  String toString() {
    return message;
  }
}

class Args {
  String name;
  String url;
  String config;
  // configContent
  late dynamic configJson;

  List get iconFonts {
    if (path.basename(config) == Constants.pubspecConfig) {
      return configJson["iconfont"] ?? [];
    }
    return configJson;
  }

  Args(this.name, this.url, this.config);
}

late Args context;