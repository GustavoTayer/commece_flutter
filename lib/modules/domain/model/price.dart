class Price {
  int value;
  String currencyCode;
  String currencySymbol;
  String decimalSeparator;
  String? thousandSeparator;
  String? prefix;
  String? suffix;

  Price({
    required this.value,
    required this.currencyCode,
    required this.currencySymbol,
    required this.decimalSeparator,
    this.thousandSeparator,
    this.prefix,
    this.suffix,
  });

  @override
  String toString() {
    String response = (value / 100).toStringAsFixed(2);
    response = response.replaceAll(RegExp(r'\D'), '');
    response = response.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'),
        thousandSeparator != null ? thousandSeparator! : '');
    response = "$prefix$response$suffix";
    return response;
  }
}
