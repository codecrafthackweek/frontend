
import 'package:calculadoras_hack_week/widgets/buttons/courses_and_tools_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/listViews/tools_listview.dart';


class ToolsHomePage extends StatelessWidget {
  const ToolsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            shrinkWrap: true,
            children: const [
          CoursesAndToolsButton(currentPage: CurrentPage.tools),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: ToolsListView(),
          ),
        ])
    );
  }
}
