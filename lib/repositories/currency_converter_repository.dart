
import 'dart:convert';
import 'package:http/http.dart';


class CurrencyConverterRepository{
  static Future<Map<String, double>> getCurrencyValues() async {

  Uri uri = Uri.https("economia.awesomeapi.com.br","/last/USD-BRL,EUR-BRL,GBP-BRL");

  Response response = await get(uri);

  if(response.statusCode != 200){
    throw "unexpected http error: ${response.statusCode}";
  }

  var jsonResponse = jsonDecode(response.body);

  Map<String, double> map = {};

  (jsonResponse as Map<String, dynamic>).forEach((key, value) {
    map[value["code"]!] = double.parse(value["high"]!);
  });

  return map;
  }
}
