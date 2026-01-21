class CurrencyInfo {
  final String code;
  final String name;
  final String symbol;
  final String flag;
  final bool isCrypto;

  const CurrencyInfo({
    required this.code,
    required this.name,
    required this.symbol,
    required this.flag,
    this.isCrypto = false,
  });
}
