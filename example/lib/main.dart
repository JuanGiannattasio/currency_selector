import 'package:flutter/material.dart';
import 'package:currency_selector/currency_selector.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Selector Test',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Selector Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await showCurrencySelectorDialog(
                  context: context,
                  title: 'Pick a currency',
                  primaryColor: Colors.blue,
                  selectedCurrency: 'USD'
                );
              },
              child: const Text('Show Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await showCurrencySelectorBottomSheet(
                  context: context,
                  title: 'Pick a currency',
                  primaryColor: Colors.green
                );
              },
              child: const Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}