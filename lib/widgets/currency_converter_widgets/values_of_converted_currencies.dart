
import 'package:flutter/material.dart';
import '../../blocs/currency_converter_bloc.dart';


class ValuesOfConvertedCurrencies extends StatelessWidget {
  final CCBloc bloc;

  const ValuesOfConvertedCurrencies({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 5),
          child: Text("Valores Convertidos:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 5),
          child: Text("Dólar:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
          child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(" \$ ", style: TextStyle(color: Colors.white70, fontSize: 27, fontWeight: FontWeight.bold),),
                  )),
              title: Row(
                children: [
                  Expanded(
                      child: Text(bloc.state.currencyConverter.usdValue, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black87),)),
                  Text(bloc.state.currencyConverter.brlToUsd, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.green),),
                ],
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 5),
          child: Text("Euro:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
          child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(" € ", style: TextStyle(color: Colors.white70, fontSize: 27, fontWeight: FontWeight.bold),),
                  )),
              title: Row(
                children: [
                  Expanded(
                      child: Text(bloc.state.currencyConverter.eurValue, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black87),)),
                  Text(bloc.state.currencyConverter.brlToEur, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.green),),
                ],
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 5),
          child: Text("Libra:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
          child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(" £ ", style: TextStyle(color: Colors.white70, fontSize: 27, fontWeight: FontWeight.bold),),
                  )),
              title: Row(
                children: [
                  Expanded(
                      child: Text(bloc.state.currencyConverter.gbpValue, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black87),)),
                  Text(bloc.state.currencyConverter.brlToGbd, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.green),),
                ],
              )),
        ),
      ],
    );
  }
}
