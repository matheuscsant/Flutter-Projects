import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_converter/app/models/currency_model.dart';

class RowCurrency extends StatelessWidget {
  const RowCurrency(
      {super.key,
      required this.controller,
      required this.currencies,
      required this.onChanged,
      required this.selectedCurrency});

  final CurrencyModel? selectedCurrency;
  final List<CurrencyModel> currencies;
  final TextEditingController controller;
  final void Function(CurrencyModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              value: selectedCurrency,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.deepPurpleAccent,
              ),
              items: currencies
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
