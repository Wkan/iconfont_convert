//  This file is automatically generated. DO NOT EDIT, all your changes would be lost.
//  https://pub.dartlang.org/packages/iconfont_convert

import 'package:flutter/material.dart';

class OtherTestIcons {
  static const String _family = 'iconfont2';
  static const String _package = 'other_package';

  OtherTestIcons._();

  static const IconData aixin = IconData(0xe8c3, fontFamily: _family, fontPackage: _package); // 爱心
  static const IconData chenggong = IconData(0xe8c4, fontFamily: _family, fontPackage: _package); // 成功
  static const IconData dianzan = IconData(0xe8c5, fontFamily: _family, fontPackage: _package); // 点赞
  static const IconData dianhua = IconData(0xe8c6, fontFamily: _family, fontPackage: _package); // 电话
  static const IconData bangzhu = IconData(0xe8c7, fontFamily: _family, fontPackage: _package); // 帮助
  static const IconData dianyingpiao = IconData(0xe8c8, fontFamily: _family, fontPackage: _package); // 电影票
  static const IconData faxian = IconData(0xe8c9, fontFamily: _family, fontPackage: _package); // 发现
  static const IconData dingwei = IconData(0xe8ca, fontFamily: _family, fontPackage: _package); // 定位
  static const IconData gonggao = IconData(0xe8cb, fontFamily: _family, fontPackage: _package); // 公告
  static const IconData huati = IconData(0xe8cc, fontFamily: _family, fontPackage: _package); // 话题
  static const IconData jianshao = IconData(0xe8cd, fontFamily: _family, fontPackage: _package); // 减少
  static const IconData huiyuan = IconData(0xe8ce, fontFamily: _family, fontPackage: _package); // 会员
  static const IconData pinglun = IconData(0xe8cf, fontFamily: _family, fontPackage: _package); // 评论
  static const IconData shequ = IconData(0xe8d0, fontFamily: _family, fontPackage: _package); // 社区
  static const IconData shibai = IconData(0xe8d1, fontFamily: _family, fontPackage: _package); // 失败
  static const IconData shijian = IconData(0xe8d2, fontFamily: _family, fontPackage: _package); // 时间
}

class _PreviewIcon {
  const _PreviewIcon(this.icon, this.name, this.propName);

  final IconData icon;
  final String name;
  final String propName;
}

class OtherTestIconsPreview extends StatelessWidget {
  const OtherTestIconsPreview({Key? key}) : super(key: key);

  static const iconList = <_PreviewIcon>[
    _PreviewIcon(OtherTestIcons.aixin, "aixin", "爱心"),
    _PreviewIcon(OtherTestIcons.chenggong, "chenggong", "成功"),
    _PreviewIcon(OtherTestIcons.dianzan, "dianzan", "点赞"),
    _PreviewIcon(OtherTestIcons.dianhua, "dianhua", "电话"),
    _PreviewIcon(OtherTestIcons.bangzhu, "bangzhu", "帮助"),
    _PreviewIcon(OtherTestIcons.dianyingpiao, "dianyingpiao", "电影票"),
    _PreviewIcon(OtherTestIcons.faxian, "faxian", "发现"),
    _PreviewIcon(OtherTestIcons.dingwei, "dingwei", "定位"),
    _PreviewIcon(OtherTestIcons.gonggao, "gonggao", "公告"),
    _PreviewIcon(OtherTestIcons.huati, "huati", "话题"),
    _PreviewIcon(OtherTestIcons.jianshao, "jianshao", "减少"),
    _PreviewIcon(OtherTestIcons.huiyuan, "huiyuan", "会员"),
    _PreviewIcon(OtherTestIcons.pinglun, "pinglun", "评论"),
    _PreviewIcon(OtherTestIcons.shequ, "shequ", "社区"),
    _PreviewIcon(OtherTestIcons.shibai, "shibai", "失败"),
    _PreviewIcon(OtherTestIcons.shijian, "shijian", "时间"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherTestIcons'),
      ),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: iconList.map((e) {
          return InkWell(
            onTap: () {
              //
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Icon(e.icon),
                ),
                Text(e.name, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
                Text(e.propName, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
