// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:money_converter/app/components/currency_box.dart';
import 'package:money_converter/app/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController? homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

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
              RowCurrency(
                key: widget.key,
                currencies: homeController!.curriencies,
                controller: toText,
                selectedCurrency: homeController?.toCurrency,
                onChanged: (currencyModel) =>
                    setState(() => homeController?.toCurrency = currencyModel),
              ),
              const SizedBox(
                height: 20,
              ),
              RowCurrency(
                key: widget.key,
                currencies: homeController!.curriencies,
                controller: fromText,
                selectedCurrency: homeController?.fromCurrency,
                onChanged: (currencyModel) =>
                    homeController?.fromCurrency = currencyModel,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => setState(
                        () => homeController?.converter(),
                      ),
                  child: const Text("CONVERTER"))
            ],
          ),
        ),
      ),
    );
  }
}
