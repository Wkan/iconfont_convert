import 'data.dart';

import 'temp/pub_template.dart';

class Pub {
  static addAssert(String family, String ttfPath) {
    if (Data.pubAsserts.containsKey(family)) {
      Data.pubAsserts[family]!.add(ttfPath);
    } else {
      Data.pubAsserts[family] = [ttfPath];
    }
  }

  static save() async {
    PubTemplate.save();
  }
}
