
import 'package:flutter/material.dart';
import '../../blocs/compound_interest_calculator_bloc.dart';
import '../../blocs/events/compound_interest_calculator_event.dart';
import 'measure_of_time_dropdown_menu_item_list.dart';


class InterestRatePercentageTextField extends StatelessWidget {
  final CICBloc bloc;
  const InterestRatePercentageTextField({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
      child: TextField(
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            icon: DropdownButton(
              items: MeasureOfTimeDropdownMenuItemList().dropDownList,
              onChanged: (newMeasureOfTime){
                if (newMeasureOfTime != null) {
                  bloc.add(NewTimeForInterestToCompoundCICEvent(newTimeForInterestToCompound: newMeasureOfTime));
                }
              },
              value: bloc.state.compoundInterestCalculator.timeForInterestToCompound,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: "1.25",
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(color: Colors.grey)
        ),
        onChanged: (newInterestRatePercentage){
          if (newInterestRatePercentage != "") {
            bloc.add(NewInterestRatePercentageCICEvent(newInterestRatePercentage: double.parse(newInterestRatePercentage)));
          } else {
            bloc.add(NewInterestRatePercentageCICEvent(newInterestRatePercentage: 1.25));
          }
        },
      ),
    );
  }
}
