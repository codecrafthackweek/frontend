
import 'package:bloc/bloc.dart';
import 'package:calculadoras_hack_week/blocs/events/currency_converter_event.dart';
import 'package:calculadoras_hack_week/blocs/states/currency_converter_state.dart';
import '../repositories/currency_converter_repository.dart';
import '../classes/currency_converter.dart';


class CCBloc extends Bloc<CCEvent, CCState>{
  late final CurrencyConverter _currencyConverter;

  CCBloc() : super(CCInitialState()) {
    on<LoadCCEvent>(
            (event, emit) async{
              Map<String, double> json = await CurrencyConverterRepository.getCurrencyValues();
              _currencyConverter = CurrencyConverter.valuesFromJson(json);
              emit (CCSuccessState(_currencyConverter));
        });

    on<NewValueCCEvent>(
            (event, emit) {
          _currencyConverter.newValue = event.newValue;
          emit (CCSuccessState(_currencyConverter));
        });
  }
}
