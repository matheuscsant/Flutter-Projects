import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_converter/app/controllers/home_controller.dart';
import 'package:money_converter/app/models/currency_model.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final HomeController homeController = HomeController(toText, fromText);

  test("Checando vírgula", () {
    toText.text = "3,0";
    homeController.converter();
    expect(fromText.text, "0.54");
  });
  test("Converter de Real para Dolar 0.18", () {
    toText.text = "1.0";
    homeController.converter();
    expect(fromText.text, "0.18");
  });
  test("Converter de Real para Dolar 0.36", () {
    toText.text = "2.0";
    homeController.converter();
    expect(fromText.text, "0.36");
  });
  test("Converter de Real para Dolar 0.54", () {
    toText.text = "3.0";
    homeController.converter();
    expect(fromText.text, "0.54");
  });

  test("Converter de Dolar para Real 5.65", () {
    toText.text = "1.0";
    homeController.toCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Dolar");
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Real");
    homeController.converter();
    expect(fromText.text, "5.65");
  });
  test("Converter de Dolar para Euro 0.85", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Euro");
    homeController.converter();
    expect(fromText.text, "0.85");
  });
  test("Converter de Dolar para Bitcoin 0.000088", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Bitcoin");
    homeController.converter();
    expect(fromText.text, "0.00");
  });
  test("Converter de Euro para Real 6.62", () {
    toText.text = "1.0";
    homeController.toCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Euro");
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Real");
    homeController.converter();
    expect(fromText.text, "6.62");
  });
  test("Converter de Euro para Dolar 1.17", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Dolar");
    homeController.converter();
    expect(fromText.text, "1.17");
  });
  test("Converter de Euro para Bitcoin 1.17", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Bitcoin");
    homeController.converter();
    expect(fromText.text, "0.00");
  });
  test("Converter de Bitcoin para Real 64116.51", () {
    toText.text = "1.0";
    homeController.toCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Bitcoin");
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Real");
    homeController.converter();
    expect(fromText.text, "64116.51");
  });
  test("Converter de Bitcoin para Dolar 11351.30", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Dolar");
    homeController.converter();
    expect(fromText.text, "11351.30");
  });
  test("Converter de Bitcoin para Euro 9689.54", () {
    toText.text = "1.0";
    homeController.fromCurrency =
        CurrencyModel.getCurrencies().singleWhere((e) => e.name == "Euro");
    homeController.converter();
    expect(fromText.text, "9689.54");
  });
}
