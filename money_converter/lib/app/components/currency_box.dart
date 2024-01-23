import 'dart:developer';

import 'package:flutter/material.dart';

class RowCurrency extends StatefulWidget {
  const RowCurrency({super.key});

  @override
  State<RowCurrency> createState() => _RowCurrencyState();
}

class _RowCurrencyState extends State<RowCurrency> {
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
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.deepPurpleAccent,
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text("Real")),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Dolar"),
                )
              ],
              onChanged: (value) {
                log(value.toString());
              },
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Expanded(
          flex: 3,
          child: SizedBox(
            child: TextField(
              decoration: InputDecoration(
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
