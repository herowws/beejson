import 'package:flutter/material.dart';

/// 统一管理 Dart 编辑器中使用的语法高亮颜色
class SyntaxColors {
  // === 原始类型 ===
  static const Color primitiveType = Color(0xFFD35400); // int, double, bool
  static const Color stringType = Color(0xFFC0392B); // String

  // === 集合类型 ===
  static const Color collectionType = Color(0xFF2980B9); // List, Set, Map

  // === 结构类关键字 ===
  static const Color classKeyword = Color(0xFF2980B9); // class
  static const Color factoryKeyword = Color(0xFF8E44AD); // factory
  static const Color returnKeyword = Color(0xFF2E8B57); // return

  // === 函数相关 ===
  static const Color methodName = Color(0xFFE6A17F); // fromJson,copyWith等自定义方法

  // === 注解、结构符号 ===
  static const Color annotation = Color(0xFF0070C1); // @override
  static const Color symbol = Color(0xFF0070C1); // { }

  // === 其他 ===
  static const Color keyword = Color(0xFF8E44AD); // 通用关键词（如 async、await）
  static const Color comment = Color(0xFF7F8C8D); // 注释
  static const Color number = Color(0xFFD35400); // 数字
  static const Color boolean = Color(0xFFD35400); // true, false
  static const Color nullValue = Color(0xFF2980B9); // null
}
