# Currency Selector

A **Flutter package** that provides a ready-to-use **currency selector widget** with:

- World currencies (flags, symbols, names, and codes)
- Searchable list
- Option to open as a **dialog** or a **bottom sheet**
- Fully customizable colors and texts
- Easy-to-use helpers

---

## Features

- Display a **list of currencies** with flags and symbols
- **Search** currencies by code or name
- **Highlight selected currency**
- Open as **Dialog** or **Bottom Sheet**
- Customizable **primary color** and **background color**
- Customizable **search hint** and **empty list text**
- Supports **custom currency lists** if desired

---

## Installation

Add this to your `pubspec.yaml`:

dependencies:
  currency_selector:
    git:
      url: https://github.com/JuanGiannattasio/currency_selector

Then import it:

`import 'package:currency_selector/currency_selector.dart';`

---

## Usage

### 1️⃣ Show as Dialog

```
final selectedCurrency = await showCurrencySelectorDialog(
  context: context,
  selectedCurrency: 'USD',
  title: 'Choose your currency',
  primaryColor: Colors.blue,
  backgroundColor: Colors.white,
  hintText: 'Search currency...',
  noCurrenciesFoundText: 'No currencies found',
);
```

### 2️⃣ Show as Bottom Sheet

```
final selectedCurrency = await showCurrencySelectorBottomSheet(
  context: context,
  title: 'Select currency',
  primaryColor: Colors.green,
  hintText: 'Type to search...',
  noCurrenciesFoundText: 'No results',
);
```

---

## Parameters

Parameter                  | Type       | Description
---------------------------|------------|--------------------------------------------------------
context                    | BuildContext | Required. Context to show the dialog/bottom sheet.
selectedCurrency           | String?    | Optional. Pre-select a currency code (e.g., "USD").
title                      | String?    | Optional. Title displayed at the top of the selector.
primaryColor               | Color?     | Optional. Color for selection highlights and icons.
backgroundColor            | Color?     | Optional. Background color of the container.
hintText                   | String?    | Optional. Text shown in the search field. Defaults to "Search currency...".
noCurrenciesFoundText      | String?    | Optional. Text shown when search returns no results. Defaults to "No currencies found".
currencies                 | List<CurrencyInfo>? | Optional. Custom list of currencies. Defaults to worldCurrencies.
isScrollControlled         | bool       | Optional. Only for bottom sheet. Controls scroll behavior. Defaults to true.

---

## Custom Currency List

You can pass your own list of CurrencyInfo:

```
final myCurrencies = [
  CurrencyInfo(code: 'USD', name: 'US Dollar', symbol: '\$', flag: '🇺🇸'),
  CurrencyInfo(code: 'EUR', name: 'Euro', symbol: '€', flag: '🇪🇺'),
];

final selected = await showCurrencySelectorDialog(
  context: context,
  currencies: myCurrencies,
);
```

---

## Example

```
import 'package:flutter/material.dart';
import 'package:currency_selector/currency_selector.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Currency Selector Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final currency = await showCurrencySelectorDialog(
                  context: context,
                  title: 'Pick a currency',
                  primaryColor: Colors.orange,
                );
                print('Selected currency: $currency');
              },
              child: Text('Show Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final currency = await showCurrencySelectorBottomSheet(
                  context: context,
                  title: 'Pick a currency',
                  primaryColor: Colors.green,
                );
                print('Selected currency: $currency');
              },
              child: Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
```# currency_selector
