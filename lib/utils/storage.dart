import 'package:shared_preferences/shared_preferences.dart';

class Storages {
  static final Storages to = Storages._();
  Storages._();
  late final SharedPreferences _prefs;

  Future<Storages> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> set(String key, String value) async {
    return _prefs.setString(key, value);
  }

  String get(String key) {
    return _prefs.getString(key) ?? '';
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
