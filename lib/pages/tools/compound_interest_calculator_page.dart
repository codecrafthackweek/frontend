
import 'package:calculadoras_hack_week/widgets/buttons/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/compound_interest_calculator_bloc.dart';
import '../../blocs/events/compound_interest_calculator_event.dart';
import '../../blocs/states/compound_interest_calculator_state.dart';
import '../../widgets/buttons/courses_and_tools_button.dart';
import '../../widgets/compound_interest_calculator_widgets/amount_of_time_invested_textfield.dart';
import '../../widgets/compound_interest_calculator_widgets/capital_textfield.dart';
import '../../widgets/compound_interest_calculator_widgets/interest_rate_percentage_textfield.dart';


class CompoundInterestCalculatorPage extends StatefulWidget {
  const CompoundInterestCalculatorPage({Key? key}) : super(key: key);

  @override
  State<CompoundInterestCalculatorPage> createState() => _CompoundInterestCalculatorPageState();
}

class _CompoundInterestCalculatorPageState extends State<CompoundInterestCalculatorPage> {
  late final CICBloc bloc;

  @override
  void initState(){
    super.initState();
    bloc = CICBloc();
    bloc.add(LoadCICEvent());
  }

  @override
  void dispose(){
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CICBloc, CICState>(
              bloc: bloc,
              builder: (context, state){
                if (state is CICInitialState){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CICSuccessState){
                  return ListView(
                          children: [
                            const CoursesAndToolsButton(currentPage: CurrentPage.tools),
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 5),
                                child: Text("Calculadora de Juros Compostos", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,),),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 5),
                              child: Text("Montante Arrecadado:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
                              child: Center(child: Text(bloc.state.compoundInterestCalculator.calculateFinalAmount, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 40, color: Colors.green),)),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 5),
                              child: Text("Valor do Capital:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            CapitalTextField(bloc: bloc,),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
                              child: Text("Taxa de Juros:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            InterestRatePercentageTextField(bloc: bloc,),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 5),
                              child: Text("Tempo Investido:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                            ),
                            AmountOfTimeInvestedTextField(bloc: bloc,),
                            const MyBackButton(route: ""),
                          ],
                  );
                }
                return Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed("/toolshomepage");
                    },
                    child: const Text("unexpected error"),),
                );
              },
        ),
    );
  }
}
