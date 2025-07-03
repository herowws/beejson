import 'package:bejson/json/json_text_builder.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';

class RenderExtendInput extends StatelessWidget {
  const RenderExtendInput({
    super.key,
    this.controller,
    this.hint,
    this.maxLines = 1,
  });
  final TextEditingController? controller;
  final String? hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ExtendedTextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        isCollapsed: true,
        hintStyle: TextStyle(fontSize: 13, color: Color(0xFF888888)),
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.6,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFCCCCCC), width: 1),
        ),
      ),
      specialTextSpanBuilder: JsonTextBuilder(),
    );
  }
}
