import 'dart:convert';
import 'dart:ui';

import 'package:bejson/component/title.dart';
import 'package:bejson/home/header_editor.dart';
import 'package:bejson/model/configure.dart';
import 'package:bejson/utils/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPannel extends StatefulWidget {
  const SettingPannel(this.configure, {super.key});
  final ConfigureModel configure;

  @override
  State<SettingPannel> createState() => _SettingPannelState();
}

class _SettingPannelState extends State<SettingPannel> {
  late ConfigureModel configure = widget.configure;

  void _changeConfig({
    bool? isCopyWith,
    bool? isFromJson,
    bool? isToJson,
    bool? isToString,
    bool? isFinal,
  }) {
    setState(() {
      configure.isCopyWith = isCopyWith ?? configure.isCopyWith;
      configure.isFromJson = isFromJson ?? configure.isFromJson;
      configure.isToJson = isToJson ?? configure.isToJson;
      configure.isToString = isToString ?? configure.isToString;
      configure.isFinal = isFinal ?? configure.isFinal;
    });
    Storages.to.set('config', jsonEncode(configure));
    debugPrint(configure.toJson().toString());
  }

  Future<void> launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) ;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          RenderTitle(icon: Icons.settings, title: '生成设置'),
          SettingOption(
            text: '生成fromJson',
            value: configure.isFromJson,
            onTap: () => _changeConfig(isFromJson: !configure.isFromJson),
          ),
          SettingOption(
            text: '生成toJson',
            value: configure.isToJson,
            onTap: () => _changeConfig(isToJson: !configure.isToJson),
          ),
          SettingOption(
            text: '生成copyWith',
            value: configure.isCopyWith,
            onTap: () => _changeConfig(isCopyWith: !configure.isCopyWith),
          ),
          SettingOption(
            text: 'final修饰字段',
            value: configure.isFinal,
            onTap: () => _changeConfig(isFinal: !configure.isFinal),
          ),
          SettingOption(
            text: '生成toString',
            value: configure.isToString,
            onTap: () => _changeConfig(isToString: !configure.isToString),
          ),
          RenderTitle(icon: Icons.settings, title: '请求头设置'),
          TextButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                builder: (context) => HeaderEditor(),
              );
            },
            child: Text('设置请求'),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              launch('https://github.com/herowws/beejson');
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Image.network(
                'https://oss.dev33.cn/sa-token/img/github.png',
                width: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  const SettingOption({
    super.key,
    required this.text,
    required this.value,
    this.onTap,
  });
  final String text;
  final bool value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: value,
              onChanged: (value) => onTap?.call(),
            ),
          ),
          Flexible(
            child: Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
