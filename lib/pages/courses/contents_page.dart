
import 'package:flutter/material.dart';
import '../../widgets/buttons/courses_and_tools_button.dart';
import '../../widgets/buttons/my_back_button.dart';
import '../../widgets/listViews/contents_listview.dart';


class ContentsPage extends StatelessWidget {
  const ContentsPage({Key? key}) : super(key: key);

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
                child: ContentsListView(contentsSubtopicId: id,),
              ),
            ],
        ),
        bottomNavigationBar: const MyBackButton(route: "",),
    );
  }
}
