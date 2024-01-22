import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> list = <String>['1.0', '4.93', '5.37', '6.27'];
const List<String> list2 = <String>['Real', 'Dollar', 'Euro', 'Libra'];

class ConverterMoedas extends StatefulWidget {
  const ConverterMoedas({super.key});

  @override
  State<ConverterMoedas> createState() => _ConverterMoedasState();
}

class _ConverterMoedasState extends State<ConverterMoedas> {
  String valorOrigem = "0.00";
  String valorDestino = "0.00";
  String localOrigem = "1.00";
  String localDestino = "1.00";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://res.cloudinary.com/dte7upwcr/image/upload/f_auto,w_1500/blog/blog2/conversor-de-moeda/conversor-de-moeda-img_header.jpg",
                width: 200,
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("De:"),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (value) => setState(
                        () {
                          value == ""
                              ? valorOrigem = "0.00"
                              : valorOrigem = value;
                          atualizarValores();
                        },
                      ),
                      textInputAction: TextInputAction.none,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'),
                        )
                      ],
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "0.00",
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownMenu(
                    menuHeight: 100,
                    enabled: false,
                    initialSelection: list.first,
                    onSelected: (value) => setState(() => localOrigem = value!),
                    dropdownMenuEntries: list
                        .map((e) => DropdownMenuEntry(
                            value: e, label: list2.elementAt(list.indexOf(e))))
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Para:"),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(valorDestino),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownMenu(
                    menuHeight: 100,
                    initialSelection: list.first,
                    onSelected: (value) => setState(() {
                      localDestino = value.toString();
                      atualizarValores();
                    }),
                    dropdownMenuEntries: list
                        .map((e) => DropdownMenuEntry(
                            value: e, label: list2.elementAt(list.indexOf(e))))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void atualizarValores() {
    try {
      valorDestino = (double.parse(valorOrigem) / double.parse(localDestino))
          .toStringAsFixed(2);
    } catch (e) {
      log(e.toString());
      valorDestino = "0.00";
      valorOrigem = "0.00";
    }
  }
}
