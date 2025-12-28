# Changelog

## [1.0.0] - 2025-12-28
### Added
- `CurrencyInfo` model to represent currency data (code, name, symbol, flag).
- Default list of world currencies (`worldCurrencies`), including fiat and popular crypto.
- Helper function `getCurrencySymbol(String code)` to get currency symbol by code.
- Helper function `getCurrencyInfo(String code)` to get full currency info by code.
- `CurrencySelector` widget:
  - Searchable list of currencies.
  - Highlight selected currency.
  - Customizable title, primary color, background color, hint text, and "no currencies found" text.
- `showCurrencySelectorDialog` helper to display the selector as a **dialog**:
  - Height and width limited, centered.
- `showCurrencySelectorBottomSheet` helper to display the selector as a **modal bottom sheet**:
  - Full device width, max height 75% of screen.
  - Supports scroll control and safe area for keyboard.
- Improved “No currencies found” state with icon and text.
- Fully documented parameters for all public functions and widgets.
- Supports custom list of currencies passed by the caller.