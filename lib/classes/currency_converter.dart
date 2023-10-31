
class CurrencyConverter{
  double value = 1;
  double _usdValue = 5;
  double _eurValue = 5;
  double _gbpValue = 5;

  CurrencyConverter();

  CurrencyConverter.valuesFromJson(Map<String, double> json){
    _usdValue = json["USD"]!;
    _eurValue = json["EUR"]!;
    _gbpValue = json["GBP"]!;
  }

  set newValue(newValue) => value = newValue;

  String get usdValue => _usdValue.toStringAsFixed(2);
  String get eurValue => _eurValue.toStringAsFixed(2);
  String get gbpValue => _gbpValue.toStringAsFixed(2);
  String get brlToUsd => "\$ ${(value / _usdValue).toStringAsFixed(2)}";
  String get brlToEur => "€ ${(value / _eurValue).toStringAsFixed(2)}";
    String get brlToGbd => "£ ${(value / _gbpValue).toStringAsFixed(2)}";
}