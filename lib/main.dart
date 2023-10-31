
import 'package:calculadoras_hack_week/pages/courses/contents_page.dart';
import 'package:calculadoras_hack_week/pages/courses/courses_home_page.dart';
import 'package:calculadoras_hack_week/pages/courses/subtopics_page.dart';
import 'package:calculadoras_hack_week/pages/tools/compound_interest_calculator_page.dart';
import 'package:calculadoras_hack_week/pages/tools/currency_converter_page.dart';
import 'package:calculadoras_hack_week/pages/tools/tools_home_page.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/courseshomepage": (context) => CoursesHomePage(),
        "/subtopicscoursespage": (context) => SubtopcisPage(),
        "/contentscoursespage": (context) => ContentsPage(),
        "/toolshomepage": (context) => ToolsHomePage(),
        "/compoundinterestcalculatorpage": (context) => CompoundInterestCalculatorPage(),
        "/currencyconverterpage": (context) => CurrencyConverterPage(),
      },
      home: CoursesHomePage(),
    );
  }
}
