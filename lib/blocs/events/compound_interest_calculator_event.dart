
import '../../classes/compound_interest_calculator.dart';


abstract class CICEvent {}


class LoadCICEvent
    extends CICEvent {}


class NewCapitalCICEvent extends CICEvent {
  double newCapital;

  NewCapitalCICEvent({required this.newCapital});
}


class NewInterestRatePercentageCICEvent extends CICEvent {
  double newInterestRatePercentage;

  NewInterestRatePercentageCICEvent({required this.newInterestRatePercentage});
}


class NewTimeForInterestToCompoundCICEvent extends CICEvent {
  MeasureOfTime newTimeForInterestToCompound;

  NewTimeForInterestToCompoundCICEvent({required this.newTimeForInterestToCompound});
}


class NewAmountOfTimeInvestedCICEvent extends CICEvent {
  double newAmountOfTimeInvested;

  NewAmountOfTimeInvestedCICEvent({required this.newAmountOfTimeInvested});
}


class NewMeasureOfTimeUsedCICEvent extends CICEvent {
  MeasureOfTime newMeasureOfTimeUsed;

  NewMeasureOfTimeUsedCICEvent({required this.newMeasureOfTimeUsed});
}