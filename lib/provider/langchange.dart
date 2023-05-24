import 'package:flutter/cupertino.dart';
import 'package:localization_arb_example/l10n/l10n.dart';

class LanguageChangeProvider with ChangeNotifier{
  Locale _currentLocale = new Locale("en");


  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale){
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }

}








class LocaleProvider extends ChangeNotifier {
  Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}











