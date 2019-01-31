import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class DemoLocalizations {
  DemoLocalizations(this.isZh);

  bool isZh = false;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter 应用" : "Flutter APP";
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "zh"].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("xxxx$locale");
    return SynchronousFuture<DemoLocalizations>(
      DemoLocalizations(locale.languageCode == 'zh')
    );
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}