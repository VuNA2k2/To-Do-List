
import 'package:flutter/material.dart';
import 'package:todo_list/languages/locale/vi.dart';
import 'package:todo_list/services/shared_data/storage_service.dart';


import 'locale/base.dart';
import 'locale/en.dart';

enum SupportedLocales { english, vietnamese }

extension SupportedLocalesX on SupportedLocales {
  Locale get locale {
    switch (this) {
      case SupportedLocales.english:
        return const Locale('en');
      case SupportedLocales.vietnamese:
        return const Locale('vi');
    }
  }
}

final _mapLanguages = {
  SupportedLocales.english.locale: LanguageEn(),
  SupportedLocales.vietnamese.locale: LanguageVi(),
};

class L {
  static BaseLanguage get current {
    var languageCode = StorageService().locale ?? "en";
    var language = _mapLanguages[Locale(languageCode)];
    if (language != null) {
      return language;
    }

    return LanguageEn();
  }

  static get delegate => AppLocalizationDelegate();
}

class AppLocalizationDelegate extends LocalizationsDelegate<BaseLanguage> {
  AppLocalizationDelegate();

  List<Locale> get supportedLocales => List.from(_mapLanguages.keys);

  bool _isSupported(Locale locale) => _mapLanguages.containsKey(locale);

  Future<BaseLanguage> _load(Locale locale) async {
    var result = _mapLanguages[locale];
    return result ?? LanguageEn();
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<BaseLanguage> load(Locale locale) => _load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
