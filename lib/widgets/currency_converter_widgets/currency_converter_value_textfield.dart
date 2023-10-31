
import 'package:flutter/material.dart';
import '../../blocs/currency_converter_bloc.dart';
import '../../blocs/events/currency_converter_event.dart';


class CurrencyConverterValueTextField extends StatelessWidget {
  final CCBloc bloc;
  const CurrencyConverterValueTextField({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 5),
          child: Text("Valor para Conversão:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
          child: TextField(
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("R\$", style: TextStyle(color: Colors.white70, fontSize: 35, fontWeight: FontWeight.bold),),
                    )),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "1",
                hintTextDirection: TextDirection.rtl,
                hintStyle: const TextStyle(color: Colors.grey)
            ),
            onChanged: (newValue){
              if (newValue != "") {
                bloc.add(NewValueCCEvent(newValue: double.parse(newValue)));
              } else{
                bloc.add(NewValueCCEvent(newValue: 1));
              }
            },
          ),
        ),
      ],
    );
  }
}
