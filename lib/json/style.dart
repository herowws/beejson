import 'package:bejson/json/syntax_colors.dart';
import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';

abstract class StyleText extends SpecialText {
  StyleText(String flag, TextStyle? textStyle, {this.start})
    : super(flag, ' ', textStyle);

  final int? start;

  @override
  InlineSpan finishText() {
    final String fullText = toString();
    return SpecialTextSpan(
      text: fullText,
      actualText: toString(),
      deleteAll: false,
      style: textStyle?.copyWith(color: getColor()),
    );
  }

  Color getColor();
}

class IntText extends StyleText {
  IntText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'int';
  @override
  Color getColor() => SyntaxColors.primitiveType;
}

class DoubleText extends StyleText {
  DoubleText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'double';
  @override
  Color getColor() => SyntaxColors.primitiveType;
}

class BoolText extends StyleText {
  BoolText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'bool';
  @override
  Color getColor() => SyntaxColors.primitiveType;
}

class StringText extends StyleText {
  StringText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'String';
  @override
  Color getColor() => SyntaxColors.stringType;
}

class SetText extends StyleText {
  SetText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'Set';
  @override
  Color getColor() => SyntaxColors.collectionType;
}

class MapText extends StyleText {
  MapText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'Map';
  @override
  Color getColor() => SyntaxColors.collectionType;
}

class ListText extends StyleText {
  ListText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'List';
  @override
  Color getColor() => SyntaxColors.collectionType;
}

class LeftCurlyText extends StyleText {
  LeftCurlyText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = '{';
  @override
  Color getColor() => SyntaxColors.symbol;
}

class RightCurlyText extends StyleText {
  RightCurlyText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = '}';
  @override
  Color getColor() => SyntaxColors.symbol;
}

class OverrideText extends StyleText {
  OverrideText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = '@override';
  @override
  Color getColor() => SyntaxColors.annotation;
}

class FinalText extends StyleText {
  FinalText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'final';
  @override
  Color getColor() => SyntaxColors.keyword;
}

class FactoryText extends StyleText {
  FactoryText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'factory';
  @override
  Color getColor() => SyntaxColors.factoryKeyword;
}

class ReturnText extends StyleText {
  ReturnText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'return';
  @override
  Color getColor() => SyntaxColors.returnKeyword;
}

class ClassText extends StyleText {
  ClassText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'class';
  @override
  Color getColor() => SyntaxColors.classKeyword;
}

class FromJsonText extends StyleText {
  FromJsonText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'fromJson';
  @override
  Color getColor() => SyntaxColors.methodName;
}

class CopyWithText extends StyleText {
  CopyWithText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'copyWith';
  @override
  Color getColor() => SyntaxColors.methodName;
}

class ToJsonText extends StyleText {
  ToJsonText(TextStyle? textStyle, {int? start})
    : super(flag, textStyle, start: start);
  static const String flag = 'toJson';
  @override
  Color getColor() => SyntaxColors.methodName;
}
