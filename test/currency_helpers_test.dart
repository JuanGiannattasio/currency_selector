import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_selector/src/helpers/currency_helpers.dart';

void main() {
  testWidgets(
    'showCurrencySelectorDialog throws error when showCryptoCurrencies is false',
    (WidgetTester tester) async {
      // reproduction of the bug
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      showCurrencySelectorDialog(
                        context: context,
                        showCryptoCurrencies: false,
                      );
                    } catch (e) {
                      // Re-throw so the test fails if it's not the expected error,
                      // or use expectLater to verify the error.
                      // For reproduction, we expect this to throw UnsupportedError.
                      throw e;
                    }
                  },
                  child: const Text('Open Dialog'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
    },
  );
}
