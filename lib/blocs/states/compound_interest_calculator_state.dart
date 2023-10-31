
import '../../classes/compound_interest_calculator.dart';


abstract class CICState {
  CompoundInterestCalculator compoundInterestCalculator;

  CICState({required this.compoundInterestCalculator});
}


class CICInitialState extends CICState {
  CICInitialState() :
        super(compoundInterestCalculator: CompoundInterestCalculator());
}


class CICSuccessState extends CICState {
  CICSuccessState(CompoundInterestCalculator compoundInterestCalculator) :
        super(compoundInterestCalculator: compoundInterestCalculator);
}