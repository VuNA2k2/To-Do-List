
import 'package:shared_preferences/shared_preferences.dart';

enum _StorageKey { token, locale, refreshToken, isLogged}

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

  ///refreshToken
  set saveRefreshToken(String value) {
    _prefs.setString(_StorageKey.refreshToken.name, value);
  }

  String? get refreshToken => _prefs.getString(_StorageKey.refreshToken.name);

  void deleteRefreshToken() => _prefs.remove(_StorageKey.refreshToken.name);

  ///isLogged
  set saveIsLogged(bool value) {
    _prefs.setBool(_StorageKey.isLogged.name, value);
  }

  bool? get isLogged => _prefs.getBool(_StorageKey.isLogged.name);

  void deleteIsLogged() => _prefs.remove(_StorageKey.isLogged.name);

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
