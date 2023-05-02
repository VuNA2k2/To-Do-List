
import 'package:shared_preferences/shared_preferences.dart';

enum _StorageKey { token, locale, refreshToken }

class StorageService {
  late SharedPreferences _prefs;
  static final StorageService _service = StorageService._internal();

  StorageService._internal();

  factory StorageService() => _service;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  ///token
  set saveToken(String value) {
    _prefs.setString(_StorageKey.token.name, value);
  }

  String? get token => _prefs.getString(_StorageKey.token.name);

  void deleteToken() => _prefs.remove(_StorageKey.token.name);

  ///locale
  set saveLocale(String locale) {
    _prefs.setString(_StorageKey.locale.name, locale);
  }

  String? get locale => _prefs.getString(_StorageKey.locale.name);

  void deleteLocale() => _prefs.remove(_StorageKey.locale.name);
  ///logout
  void logout() {
    _prefs.remove(_StorageKey.token.name);
    _prefs.remove(_StorageKey.refreshToken.name);
  }

  ///clear all
  void clearAll() {
    _prefs.clear();
  }
}
