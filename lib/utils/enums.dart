// ignore: constant_identifier_names

import 'package:flutter/material.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete;

  @override
  String toString() {
    return super.toString().split('.').last.toUpperCase();
  }

  Color toColor() {
    switch (this) {
      case HttpMethod.get:
        return Color(0xFF53AF71);
      case HttpMethod.post:
        return Color(0xFFE07742);
      case HttpMethod.put:
        return Color(0xFF4C8EF2);
      case HttpMethod.delete:
        return Color(0xFFDE5242);
    }
  }
}
