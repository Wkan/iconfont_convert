import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class Utils {
  /// camel to snake
  static String snake(String str, {String separator = "_"}) {
    RegExp reg = RegExp(
        r"[A-Z\xC0-\xD6\xD8-\xDE]?[a-z\xDF-\xF6\xF8-\xFF]+|[A-Z\xC0-\xD6\xD8-\xDE]+(?![a-z\xDF-\xF6\xF8-\xFF])|\d+");
    return reg
        .allMatches(str)
        .map((e) => e.group(0)?.toLowerCase())
        .where((e) => e != null)
        .join(separator);
  }

  /// snake to camel
  static String camel(String str, {bool pascalCase = false}) {
    RegExp reg = RegExp(r"(?:^|_)(\w)");
    var s = str.replaceAllMapped(reg, (Match m) => m[1]!.toUpperCase());
    if (!pascalCase) {
      s = "${s[0].toLowerCase()}${s.substring(1)}";
    }
    return s;
  }

  /// create dir if not exists include not exists path
  static createDir(String p) {
    final dir = Directory(p);
    if (!dir.existsSync()) dir.createSync(recursive: true);
  }

  /// write string to file
  static writeToFile(String filePath, String contents) {
    createDir(path.dirname(filePath));
    File(filePath).writeAsStringSync(contents);
  }

  /// write bytes to file
  static writeBytesToFile(String filePath, Uint8List bytes) {
    createDir(path.dirname(filePath));
    File(filePath).writeAsBytesSync(bytes);
  }

  static Future<http.Response> _httpGetResponse(String url) async {
    Uri uri = Uri.parse(url);
    uri = uri.replace(scheme: "http");

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      print("${uri.toString()} 请求失败 , statusCode = ${resp.statusCode}");
      return resp;
    }

    return resp;
  }

  /// get http response body as string
  static Future<String> httpGetContent(String url) async {
    final resp = await _httpGetResponse(url);

    if (resp.headers.containsKey("content-type") &&
        resp.headers["content-type"]!.contains("application/json")) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      return utf8decoder.convert(resp.bodyBytes);
    }

    return resp.body;
  }

  /// download url to file
  static Future<void> downloadToFile(String filePath, String url) async {
    final resp = await _httpGetResponse(url);

    writeBytesToFile(filePath, resp.bodyBytes);
  }
}
