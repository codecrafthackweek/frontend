
import 'package:flutter/material.dart';
import '../../blocs/compound_interest_calculator_bloc.dart';
import '../../blocs/events/compound_interest_calculator_event.dart';


class CapitalTextField extends StatelessWidget {
  final CICBloc bloc;

  const CapitalTextField({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: "100",
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(color: Colors.grey)
        ),
        onChanged: (newCapital){
          if (newCapital != "") {
            bloc.add(NewCapitalCICEvent(newCapital: double.parse(newCapital)));
          } else {
            bloc.add(NewCapitalCICEvent(newCapital: 100));
          }
        },
      ),
    );
  }
}
