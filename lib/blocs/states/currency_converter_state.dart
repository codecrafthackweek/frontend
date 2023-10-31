
import 'package:calculadoras_hack_week/classes/currency_converter.dart';


abstract class CCState{
  CurrencyConverter currencyConverter;

  CCState({required this.currencyConverter});
}


class CCInitialState extends CCState{
  CCInitialState():
    super(currencyConverter: CurrencyConverter());
}


class CCSuccessState extends CCState{
  CCSuccessState(CurrencyConverter currencyConverter):
        super(currencyConverter: currencyConverter);
}
