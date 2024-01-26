import 'package:flutter/material.dart';
import 'package:money_converter/app/models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> curriencies;

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController(
    this.toText,
    this.fromText,
  ) {
    curriencies = CurrencyModel.getCurrencies();
    toCurrency = curriencies[0];
    fromCurrency = curriencies[1];
  }

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency?.name == "Real") {
      returnValue = value * toCurrency!.real;
    } else if (fromCurrency?.name == "Dolar") {
      returnValue = value * toCurrency!.dolar;
    } else if (fromCurrency?.name == "Euro") {
      returnValue = value * toCurrency!.euro;
    } else if (fromCurrency?.name == "Bitcoin") {
      returnValue = value * toCurrency!.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
