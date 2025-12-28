import '../data/world_currencies.dart';
import '../models/currency_info.dart';

String getCurrencySymbol(String code) {
  try {
    return worldCurrencies.firstWhere((c) => c.code == code).symbol;
  } catch (_) {
    return '\$';
  }
}

CurrencyInfo? getCurrencyInfo(String code) {
  try {
    return worldCurrencies.firstWhere((c) => c.code == code);
  } catch (_) {
    return null;
  }
}