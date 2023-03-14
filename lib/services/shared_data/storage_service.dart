
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/utils/extensions/enum_extensions.dart';

enum _StorageKey { token, locale }

class StorageService {
  late SharedPreferences _prefs;
  static final StorageService _service = StorageService._internal();

  StorageService._internal();

  factory StorageService() => _service;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set saveToken(String value) {
    _prefs.setString(_StorageKey.token.text, value);
  }

  String? get token => _prefs.getString(_StorageKey.token.text);

  Future<bool> get deleteToken => _prefs.remove(_StorageKey.token.text);

  set saveLocale(String locale) {
    _prefs.setString(_StorageKey.locale.text, locale);
  }

  String? get locale => _prefs.getString(_StorageKey.locale.text);

  Future<bool> get deleteLocale => _prefs.remove(_StorageKey.locale.text);

  void clear() {
    _prefs.remove(_StorageKey.token.name);
    _prefs.remove(_StorageKey.locale.name);
  }
}
