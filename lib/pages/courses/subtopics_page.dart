
import 'package:calculadoras_hack_week/widgets/listViews/subtopics_listview.dart';
import 'package:flutter/material.dart';
import '../../widgets/buttons/courses_and_tools_button.dart';
import '../../widgets/buttons/my_back_button.dart';


class SubtopcisPage extends StatelessWidget {
  const SubtopcisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
        body: ListView(
            shrinkWrap: true,
            children: [
              const CoursesAndToolsButton(currentPage: CurrentPage.courses),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SubtopicsListView(subtopicsCourseId: id),
              ),
            ]),
      bottomNavigationBar: MyBackButton(route: "",),
    );
  }
}
