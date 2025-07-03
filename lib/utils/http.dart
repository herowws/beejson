import 'dart:convert';

import 'package:bejson/utils/enums.dart';
import 'package:http/http.dart' as http;

class HttpUtil {
  static Future<http.Response> request(
    String url, {
    required HttpMethod httpMethod,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      switch (httpMethod) {
        case HttpMethod.get:
          return await get(url, headers: headers);
        case HttpMethod.post:
          return await post(url, headers: headers, body: body);
        case HttpMethod.put:
          return await put(url, headers: headers, body: body);
        case HttpMethod.delete:
          return await delete(url, headers: headers, body: body);
      }
    } catch (e) {
      return http.Response('请求失败: $e', -1);
    }
  }

  static Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  static Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body is String ? body : jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body is String ? body : jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
      body: body is String ? body : jsonEncode(body),
    );
    return response;
  }
}
