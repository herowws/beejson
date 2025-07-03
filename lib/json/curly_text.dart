import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CurlyText extends SpecialText {
  CurlyText(
    TextStyle? textStyle,
    SpecialTextGestureTapCallback? onTap, {
    this.start,
  }) : super(startFlagConst, endFlagConst, textStyle, onTap: onTap);

  static const String startFlagConst = '{';
  static const String endFlagConst = '}';
  final int? start;

  @override
  InlineSpan finishText() {
    final String content = getContent();
    final String fullText = toString();
    final color = Color(0xFFF9D849);
    return TextSpan(
      children: [
        TextSpan(
          text: startFlagConst,
          style: textStyle?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        TextSpan(text: content, style: textStyle),
        TextSpan(
          text: endFlagConst,
          style: textStyle?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (onTap != null) {
            onTap!(fullText);
          }
        },
    );
  }
}

// 示例花括号文本列表
List<String> curlyList = <String>[
  '{变量名}',
  '{用户名}',
  '{配置项}',
  '{Flutter}',
  '{特殊文本}',
  '{花括号内容}',
];
