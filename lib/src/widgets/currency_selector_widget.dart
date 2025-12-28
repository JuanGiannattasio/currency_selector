import 'package:flutter/material.dart';
import '../models/currency_info.dart';

/// A reusable currency selector widget that can be displayed
/// either as a dialog or a modal bottom sheet.
///
/// This widget is internal and should be opened using
/// [showCurrencySelectorDialog] or
/// [showCurrencySelectorBottomSheet].
/// Internal widget that displays the currency selector list
class CurrencySelector extends StatefulWidget {
  /// List of currencies to display
  final List<CurrencyInfo> currencies;

  /// Currently selected currency code (e.g., 'USD')
  final String? selectedCurrency;

  /// Optional title displayed at the top
  final String? title;

  /// Optional text for the search field
  final String? hintText;

  /// Optional text when no currencies found
  final String? noCurrenciesFoundText;

  /// Primary color for selection highlight and icons
  final Color? primaryColor;

  /// Background color of the container
  final Color? backgroundColor;

  const CurrencySelector({
    super.key,
    required this.currencies,
    this.selectedCurrency,
    this.title,
    this.primaryColor,
    this.backgroundColor,
    this.hintText,
    this.noCurrenciesFoundText,
  });

  @override
  State<CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelector> {
  final TextEditingController _searchController = TextEditingController();
  late List<CurrencyInfo> _filteredCurrencies;

  @override
  void initState() {
    super.initState();
    _filteredCurrencies = widget.currencies;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filters the currencies based on query
  void _filterCurrencies(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCurrencies = widget.currencies;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredCurrencies = widget.currencies.where((c) {
          return c.code.toLowerCase().contains(lowerQuery) ||
              c.name.toLowerCase().contains(lowerQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final primaryColor = widget.primaryColor ?? colorScheme.primary;
    final backgroundColor = widget.backgroundColor ?? colorScheme.surface;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
        maxWidth: 400,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keep height limited like original dialog
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.currency_exchange, color: primaryColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title ?? 'Select currency',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  onChanged: _filterCurrencies,
                  decoration: InputDecoration(
                    hintText: widget.hintText ?? 'Search currency...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Currency List
          Flexible(
            child: _filteredCurrencies.isEmpty
                ? Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search_off,
                  size: 48,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.3),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.noCurrenciesFoundText ?? 'No currencies found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _filteredCurrencies.length,
                    itemBuilder: (context, index) {
                      final currency = _filteredCurrencies[index];
                      final isSelected = currency.code == widget.selectedCurrency;

                      return Material(
                        color: isSelected
                            ? primaryColor.withValues(alpha: 0.1)
                            : Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(currency.code),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Row(
                              children: [
                                Text(currency.flag, style: const TextStyle(fontSize: 24)),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            currency.code,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: isSelected
                                                  ? primaryColor
                                                  : colorScheme.onSurface,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: colorScheme.onSurface
                                                  .withValues(alpha: 0.08),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              currency.symbol,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: colorScheme.onSurface
                                                    .withValues(alpha: 0.6),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        currency.name,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: primaryColor,
                                    size: 24,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}