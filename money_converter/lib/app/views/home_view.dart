import 'package:flutter/material.dart';
import 'package:money_converter/app/components/currency_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 30,
            left: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", height: 150, width: 150),
              const SizedBox(
                height: 10,
              ),
              RowCurrency(key: super.key),
              const SizedBox(
                height: 20,
              ),
              RowCurrency(key: super.key),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("CONVERTER"))
            ],
          ),
        ),
      ),
    );
  }
}
