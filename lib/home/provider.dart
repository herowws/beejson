import 'dart:convert';

import 'package:bejson/json/jackson.dart';
import 'package:bejson/model/configure.dart';
import 'package:bejson/utils/enums.dart';
import 'package:bejson/utils/http.dart';
import 'package:bejson/utils/storage.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final apiController = TextEditingController();
  final jsonController = TextEditingController();
  final dartController = TextEditingController();
  ConfigureModel config = ConfigureModel();

  HttpMethod _httpMethod = HttpMethod.get;
  HttpMethod get httpMethod => _httpMethod;
  set httpMethod(HttpMethod value) {
    _httpMethod = value;
    notifyListeners();
  }

  HomeProvider() {
    _initConfigure();
    _listener();
  }

  void _listener() {
    jsonController.addListener(onGenerateDart);
  }

  void _initConfigure() {
    final result = Storages.to.get('config');
    if (result.isNotEmpty) {
      config = ConfigureModel.fromJson(jsonDecode(result));
    }
  }

  void onGenerateDart() {
    final jsonStr = jsonController.text;
    if (jsonStr.trim().isEmpty) return;
    try {
      dartController.text = Jackson.jsonToDart(jsonStr, 'BeeModel', config);
      notifyListeners();
    } catch (e) {
      dartController.text = '// 解析失败: \n$e';
      notifyListeners();
    }
  }

  Future<void> onRequest() async {
    final url = apiController.text.trim();
    if (url.isEmpty) return;
    if (!url.startsWith('http')) {
      jsonController.text = 'No host specified in URI $url';
      return;
    }
    try {
      final response = await HttpUtil.request(url, httpMethod: httpMethod);
      jsonController.text = response.body;
    } catch (e) {
      jsonController.text = e.toString();
    }
    notifyListeners();
  }

  void clearText() {
    jsonController.clear();
    dartController.clear();
  }
}
