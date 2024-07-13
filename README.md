# iconfont_convert [![Pub](https://img.shields.io/pub/v/iconfont_convert.svg?style=flat-square)](https://pub.dartlang.org/packages/iconfont_convert)

帮助你从 [www.iconfont.cn](https://www.iconfont.cn/) 生成 `IconData`

支持多个 `iconfont` 项目

可自动在 `pubspec.yaml` 中注册字体

## 安装

### 在项目中安装（推荐）

在 `pubspec.yaml` 中添加

```yaml
dev_dependencies:
  iconfont: ^1.0.0
```

运行方式

```shell
flutter packages pub run iconfont_convert
```


### 全局安装

```shell
flutter pub global activate iconfont_convert
```

运行方式

```shell
iconfont-convert
```


### 参数

```text
-c  --config     config file path
                 (defaults to "pubspec.yaml")
-h, --help       help

```


## 使用

在 `pubspec.yaml` 中添加配置

```yaml
# pubspec.yaml
iconfont:
  - icons:
    - url: //at.alicdn.com/t/c/font_3892650_94qckhszrmg.css
      icon_name: test_icons
      icon_class: TestIcons
      #font_family: other_test_icons #可以用来覆盖默认的 Font Family
      #package: other_package #在其他 package 中定义图标时记得添加包名
    font_assets_path: assets/iconfont/
    icon_class_path: lib/icons/
```

运行 `iconfont-convert`

或者使用独立独立配置文件 `iconfont.yaml`

```yaml
# iconfont.yaml
- icons:
  - url: //at.alicdn.com/t/c/font_3892650_94qckhszrmg.css
    icon_name: test_icons
    icon_class: TestIcons
  font_assets_path: assets/iconfont/
  icon_class_path: lib/icons/
```

运行 `iconfont-convert --config iconfont.yaml`

## 常见问题

1. [iconfont command not found](https://dart.dev/tools/pub/cmd/pub-global#running-a-script)
2. 多个图标项目的字体名会冲突，可以使用 `font_family` 来设置不同的字体名，推荐在 iconfont.cn 的项目设置中修改 Font Family

## 感谢

* [iconfont_flutter](https://github.com/chuanci/iconfont)
* [voca.js](https://github.com/panzerdp/voca)