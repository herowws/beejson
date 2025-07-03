import 'package:flutter/material.dart';

class RenderInput extends StatelessWidget {
  const RenderInput({
    super.key,
    this.controller,
    this.hint,
    this.maxLines = 1,
    this.prefixIcon,
  });
  final TextEditingController? controller;
  final String? hint;
  final int maxLines;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(fontSize: 13),
      decoration: InputDecoration(
        hintText: hint,
        isCollapsed: true,
        prefixIcon: prefixIcon,
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
    );
  }
}
