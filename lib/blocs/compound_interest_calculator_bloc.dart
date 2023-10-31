
import 'package:bloc/bloc.dart';
import '../classes/compound_interest_calculator.dart';
import 'events/compound_interest_calculator_event.dart';
import 'states/compound_interest_calculator_state.dart';


class CICBloc extends Bloc<CICEvent, CICState>{
  final CompoundInterestCalculator _compoundInterestCalculator =
                                      CompoundInterestCalculator();

  CICBloc() :
        super(CICInitialState()) {

    on<LoadCICEvent>(
        (event, emit) {
          emit(CICSuccessState(_compoundInterestCalculator));
        });

    on<NewCapitalCICEvent>(
        (event, emit) {
          _compoundInterestCalculator.newCapital =
              event.newCapital;
          emit(CICSuccessState(_compoundInterestCalculator));
        });

    on<NewInterestRatePercentageCICEvent>(
        (event, emit) {
          _compoundInterestCalculator.newInterestRatePercentage =
              event.newInterestRatePercentage;
          emit(CICSuccessState(_compoundInterestCalculator));
        });

    on<NewTimeForInterestToCompoundCICEvent>(
        (event, emit) {
          _compoundInterestCalculator.newTimeForInterestToCompound =
            event.newTimeForInterestToCompound;
          emit(CICSuccessState(_compoundInterestCalculator));
        });

    on<NewAmountOfTimeInvestedCICEvent>(
        (event, emit) {
          _compoundInterestCalculator.newAmountOfTimeInvested =
            event.newAmountOfTimeInvested;
          emit(CICSuccessState(_compoundInterestCalculator));
        });

    on<NewMeasureOfTimeUsedCICEvent>(
        (event, emit) {
          _compoundInterestCalculator.newMeasureOfTimeUsed =
            event.newMeasureOfTimeUsed;
          emit(CICSuccessState(_compoundInterestCalculator));
        });
  }
}