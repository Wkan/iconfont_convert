import "package:iconfont_convert/src/utils.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("test string utils", () {
    test("it can convert camel to snake", () {
      expect(Utils.snake("HelloWorld"), "hello_world");
      expect(Utils.snake("Hello"), "hello");
      expect(Utils.snake("helloWorld"), "hello_world");
      expect(Utils.snake("hello_world"), "hello_world");
      expect(Utils.snake("a"), "a");
      expect(Utils.snake("HelloWorld", separator: "-"), "hello-world");
      expect(Utils.snake("CI"), "ci");
      expect(Utils.snake("AIRobot"), "ai_robot");
      expect(Utils.snake("AiKKRobot"), "ai_kk_robot");
      expect(Utils.snake("AiKKRobot123"), "ai_kk_robot_123");
    });

    test("it can covert snake to camel", () {
      expect(Utils.camel("hello_world"), "helloWorld");
      expect(Utils.camel("hello"), "hello");
      expect(Utils.camel("hello_world", pascalCase: true), "HelloWorld");
    });
  });
}
