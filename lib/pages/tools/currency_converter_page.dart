
import 'package:calculadoras_hack_week/blocs/currency_converter_bloc.dart';
import 'package:calculadoras_hack_week/blocs/events/currency_converter_event.dart';
import 'package:calculadoras_hack_week/blocs/states/currency_converter_state.dart';
import 'package:calculadoras_hack_week/widgets/buttons/my_back_button.dart';
import 'package:calculadoras_hack_week/widgets/currency_converter_widgets/currency_converter_value_textfield.dart';
import 'package:calculadoras_hack_week/widgets/currency_converter_widgets/values_of_converted_currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/buttons/courses_and_tools_button.dart';


class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  late final CCBloc bloc;

  @override
  void initState(){
    super.initState();
    bloc  = CCBloc();
    bloc.add(LoadCCEvent());
  }

  @override
  void dispose(){
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CCBloc, CCState>(
          bloc: bloc,
          builder: (context, state){
            if (state is CCInitialState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CCSuccessState){
              return ListView(
                shrinkWrap: true,
                children: [
                  const CoursesAndToolsButton(currentPage: CurrentPage.tools),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
                      child: Text("Conversor de Moeda", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,),),
                    ),
                  ),
                  ValuesOfConvertedCurrencies(bloc: bloc),
                  CurrencyConverterValueTextField(bloc: bloc),
                  const MyBackButton(route: "")
                ],
              );
            }
            //return const Text("unexpected error");
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){
                      bloc.add(LoadCCEvent());
                      Navigator.of(context).pushReplacementNamed("/toolshomepage");
                    },
                    child: const Text("unexpected error"),),
                  Text("$state", style: const TextStyle(color: Colors.red),)
                ],
              ),
            );
          }
      )

    );
  }
}
