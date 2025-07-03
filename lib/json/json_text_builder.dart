import 'package:bejson/json/style.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';

class JsonTextBuilder extends SpecialTextSpanBuilder {
  @override
  SpecialText? createSpecialText(
    String flag, {
    TextStyle? textStyle,
    SpecialTextGestureTapCallback? onTap,
    int? index,
  }) {
    if (flag == '') return null;

    if (isStart(flag, IntText.flag)) {
      return IntText(textStyle);
    } else if (isStart(flag, DoubleText.flag)) {
      return DoubleText(textStyle);
    } else if (isStart(flag, BoolText.flag)) {
      return BoolText(textStyle);
    } else if (isStart(flag, StringText.flag)) {
      return StringText(textStyle);
    } else if (isStart(flag, SetText.flag)) {
      return SetText(textStyle);
    } else if (isStart(flag, MapText.flag)) {
      return MapText(textStyle);
    } else if (isStart(flag, ListText.flag)) {
      return ListText(textStyle);
    } else if (isStart(flag, LeftCurlyText.flag)) {
      return LeftCurlyText(textStyle);
    } else if (isStart(flag, RightCurlyText.flag)) {
      return RightCurlyText(textStyle);
    } else if (isStart(flag, OverrideText.flag)) {
      return OverrideText(textStyle);
    } else if (isStart(flag, FromJsonText.flag)) {
      return FromJsonText(textStyle);
    } else if (isStart(flag, FactoryText.flag)) {
      return FactoryText(textStyle);
    } else if (isStart(flag, ReturnText.flag)) {
      return ReturnText(textStyle);
    } else if (isStart(flag, ClassText.flag)) {
      return ClassText(textStyle);
    } else if (isStart(flag, ToJsonText.flag)) {
      return ToJsonText(textStyle);
    } else if (isStart(flag, CopyWithText.flag)) {
      return CopyWithText(textStyle);
    } else if (isStart(flag, FinalText.flag)) {
      return FinalText(textStyle);
    }

    return null;
  }
}
