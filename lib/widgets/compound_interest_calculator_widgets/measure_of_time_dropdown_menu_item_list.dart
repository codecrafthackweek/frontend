
import 'package:flutter/material.dart';
import '../../classes/compound_interest_calculator.dart';


class MeasureOfTimeDropdownMenuItemList {
  List<DropdownMenuItem> get dropDownList{
  return [
          DropdownMenuItem(value: MeasureOfTime.day,child: Text("Dias"),),
          DropdownMenuItem(value: MeasureOfTime.week,child: Text("Semanas"),),
          DropdownMenuItem(value: MeasureOfTime.month,child: Text("Meses"),),
          DropdownMenuItem(value: MeasureOfTime.twoMonths,child: Text("Bimestres"),),
          DropdownMenuItem(value: MeasureOfTime.quarter,child: Text("Trimestres"),),
          DropdownMenuItem(value: MeasureOfTime.semester,child: Text("Semestres"),),
          DropdownMenuItem(value: MeasureOfTime.yearly,child: Text("Anos"),),
        ];
  }
}