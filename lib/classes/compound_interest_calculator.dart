
import 'dart:math';

enum MeasureOfTime {
  day(1),
  week(7),
  month(30),
  twoMonths(60),
  quarter(90),
  semester(180),
  yearly(360);

  const MeasureOfTime(this.numberOfDays);
  final double numberOfDays;
}


class CompoundInterestCalculator {

  double capital = 100;
  double interestRatePercentage = 1.25;
  MeasureOfTime timeForInterestToCompound = MeasureOfTime.month;
  double amountOfTimeInvested = 1;
  MeasureOfTime measureOfTimeUsed = MeasureOfTime.yearly;

  set newCapital(double newValue) => capital = newValue;
  set newInterestRatePercentage(double newValue) =>
        interestRatePercentage = newValue;
  set newTimeForInterestToCompound(MeasureOfTime newValue) =>
        timeForInterestToCompound = newValue;
  set newAmountOfTimeInvested(double newValue) =>
        amountOfTimeInvested = newValue;
  set newMeasureOfTimeUsed(MeasureOfTime newValue) =>
        measureOfTimeUsed = newValue;

  String get calculateFinalAmount{
    double interestRate = interestRatePercentage / 100;
    double timeForInterestToBeCompoundedConverted =
        measureOfTimeUsed.numberOfDays /
         timeForInterestToCompound.numberOfDays
          * amountOfTimeInvested;
    double finalAmount = capital *
        pow((1+interestRate),timeForInterestToBeCompoundedConverted);
    return "R\$  ${finalAmount.toStringAsFixed(2)}";
  }
}
