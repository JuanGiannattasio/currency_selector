import 'package:currency_selector/currency_selector.dart';
import 'package:flutter/material.dart';

/// Shows the currency selector as a dialog.
///
/// Opens a modal dialog with a searchable list of currencies.
/// 
/// Returns the selected currency code, or null if the dialog is dismissed.
///
/// Parameters:
/// - [context]: The BuildContext to display the dialog.
/// - [selectedCurrency]: Optional. Pre-selected currency code (e.g., 'USD').
/// - [title]: Optional. Dialog title.
/// - [primaryColor]: Optional. Color for selection and highlights.
/// - [backgroundColor]: Optional. Dialog background color.
/// - [hintText]: Optional. Text for the search field (default: "Search currency...").
/// - [noCurrenciesFoundText]: Optional. Text when no currencies are found (default: "No currencies found").
/// - [currencies]: Optional. Custom list of currencies (default: worldCurrencies).
Future<String?> showCurrencySelectorDialog({
  required BuildContext context,
  String? selectedCurrency,
  String? title,
  Color? primaryColor,
  Color? backgroundColor,
  String? hintText,
  String? noCurrenciesFoundText,
  List<CurrencyInfo>? currencies,
}) {
  final currencyList = currencies ?? worldCurrencies;

  return showDialog<String>(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: CurrencySelector(
        currencies: currencyList,
        selectedCurrency: selectedCurrency,
        title: title,
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        hintText: hintText,
        noCurrenciesFoundText: noCurrenciesFoundText,
      ),
    ),
  );
}

/// Shows the currency selector as a Bottom Sheet.
///
/// Opens a bottom sheet with a searchable list of currencies.
/// 
/// Returns the selected currency code, or null if the dialog is dismissed.
///
/// Parameters:
/// - [context]: The BuildContext to display the dialog.
/// - [selectedCurrency]: Optional. Pre-selected currency code (e.g., 'USD').
/// - [title]: Optional. Dialog title.
/// - [primaryColor]: Optional. Color for selection and highlights.
/// - [backgroundColor]: Optional. Dialog background color.
/// - [hintText]: Optional. Text for the search field (default: "Search currency...").
/// - [noCurrenciesFoundText]: Optional. Text when no currencies are found (default: "No currencies found").
/// - [currencies]: Optional. Custom list of currencies (default: worldCurrencies).
/// - [isScrollControlled]: Optional. Flutter BottomSheet parameter.
Future<String?> showCurrencySelectorBottomSheet({
  required BuildContext context,
  String? selectedCurrency,
  String? title,
  Color? primaryColor,
  Color? backgroundColor,
  String? hintText,
  String? noCurrenciesFoundText,
  List<CurrencyInfo>? currencies,
  bool isScrollControlled = true,
}) {
  final currencyList = currencies ?? worldCurrencies;

  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity, 
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: CurrencySelector(
          currencies: currencyList,
          selectedCurrency: selectedCurrency,
          title: title,
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          hintText: hintText,
          noCurrenciesFoundText: noCurrenciesFoundText,
        ),
      ),
    ),
  );
}