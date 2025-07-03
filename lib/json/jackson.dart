import 'dart:convert';

import 'package:bejson/model/configure.dart';

class Jackson {
  static String jsonToDart(
    String jsonStr,
    String className,
    ConfigureModel config,
  ) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    final buffer = StringBuffer();
    final subModels = <String>[];
    final subModelNames = <String>{};

    _generateModel(
      buffer,
      subModels,
      subModelNames,
      jsonMap,
      className,
      config,
    );

    for (final sub in subModels) {
      buffer.writeln('\n// ===============================================\n');
      buffer.writeln(sub);
    }
    return buffer.toString();
  }

  static void _generateModel(
    StringBuffer buffer,
    List<String> subModels,
    Set<String> subModelNames,
    Map<String, dynamic> jsonMap,
    String className,
    ConfigureModel config,
  ) {
    buffer.writeln('class $className {');
    jsonMap.forEach((key, value) {
      String type = _getDartType(value, key, subModels, subModelNames, config);
      final nullableType = type.endsWith('?') ? type : '$type?';
      final fieldType = config.isFinal ? 'final $nullableType' : nullableType;
      buffer.writeln('  $fieldType $key;');
    });
    buffer.writeln();

    buffer.write('  $className({');
    buffer.write(jsonMap.keys.map((k) => 'this.$k').join(', '));
    buffer.writeln('});\n');

    if (config.isFromJson) {
      buffer.writeln(
        '  factory $className.fromJson(Map<String, dynamic> json) {',
      );
      jsonMap.forEach((key, value) {
        if (value is List && value.isNotEmpty && value.first is Map) {
          final subModelName = '${_capitalize(key)}Model';
          buffer.writeln('    List<$subModelName> $key = [];');
          buffer.writeln('    if (json[\'$key\'] is List) {');
          buffer.writeln('      for (var item in json[\'$key\']) {');
          buffer.writeln('        $key.add($subModelName.fromJson(item));');
          buffer.writeln('      }');
          buffer.writeln('    }');
        }
      });
      buffer.writeln('    return $className(');
      jsonMap.forEach((key, value) {
        if (value is List && value.isNotEmpty && value.first is Map) {
          buffer.writeln('      $key: $key,');
        } else {
          final typeExpr = _getDartTypeForFromJson(value, key);
          buffer.writeln('      $key: $typeExpr,');
        }
      });
      buffer.writeln('    );');
      buffer.writeln('  }\n');
    }

    if (config.isToJson) {
      buffer.writeln('  Map<String, dynamic> toJson() {');
      buffer.writeln('    return {');
      jsonMap.forEach((key, value) {
        buffer.writeln('      "$key": $key,');
      });
      buffer.writeln('    };');
      buffer.writeln('  }\n');
    }

    if (config.isToString) {
      buffer.writeln('  @override');
      buffer.writeln('  String toString() {');
      buffer.write("    return '$className(");
      buffer.write(jsonMap.keys.map((k) => '$k: \$$k').join(', '));
      buffer.writeln(")';");
      buffer.writeln('  }\n');
    }

    if (config.isCopyWith) {
      buffer.writeln('  $className copyWith({');
      jsonMap.forEach((key, value) {
        String type = _getDartType(
          value,
          key,
          subModels,
          subModelNames,
          config,
        );
        final nullableType = type.endsWith('?') ? type : '$type?';
        buffer.writeln('    $nullableType $key,');
      });
      buffer.writeln('  }) {');
      buffer.writeln('    return $className(');
      jsonMap.forEach((key, value) {
        buffer.writeln('      $key: $key ?? this.$key,');
      });
      buffer.writeln('    );');
      buffer.writeln('  }');
    }
    buffer.writeln('}');
  }

  static String _getDartType(
    dynamic value,
    String key,
    List<String> subModels,
    Set<String> subModelNames,
    ConfigureModel config,
  ) {
    if (value is int) return 'int';
    if (value is double) return 'double';
    if (value is bool) return 'bool';
    if (value is String) return 'String';
    if (value is List && value.isNotEmpty && value.first is Map) {
      final subModelName = '${_capitalize(key)}Model';
      if (!subModelNames.contains(subModelName)) {
        subModels.add(
          _generateSubModel(
            value.first,
            subModelName,
            config,
            subModelNames,
            subModels,
          ),
        );
        subModelNames.add(subModelName);
      }
      return 'List<$subModelName>';
    }
    if (value is List) return 'List';
    if (value is Map) return 'Map<String, dynamic>';
    return 'String';
  }

  static String _generateSubModel(
    Map<String, dynamic> jsonMap,
    String className,
    ConfigureModel config,
    Set<String> subModelNames,
    List<String> subModels,
  ) {
    final buffer = StringBuffer();
    _generateModel(
      buffer,
      subModels,
      subModelNames,
      jsonMap,
      className,
      config,
    );
    return buffer.toString();
  }

  static String _getDartTypeForFromJson(dynamic value, String key) {
    if (value is int) return "int.tryParse('\${json['$key']}')";
    if (value is double) return "double.tryParse('\${json['$key']}')";
    if (value is bool) return "bool.tryParse('\${json['$key']}')";
    if (value is String) return "json['$key'] as String?";
    return "json['$key']";
  }

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}
