
import 'package:flutter/material.dart';
import 'package:calculadoras_hack_week/widgets/listViews/courses_listview.dart';
import '../../widgets/buttons/courses_and_tools_button.dart';


class CoursesHomePage extends StatelessWidget {
  const CoursesHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CoursesAndToolsButton(currentPage: CurrentPage.courses),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CoursesListView(),
                  ),
                ])
            );
  }
}
