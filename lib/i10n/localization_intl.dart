import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class DemoLocalizations {
  static Future<DemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b){
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      "Flutter App",
      name: 'title',
      desc: 'Title for the Demo application'
    );
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "zh"].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return DemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}