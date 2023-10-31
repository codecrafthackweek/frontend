
import 'package:calculadoras_hack_week/colors/listview_colors.dart';
import 'package:flutter/material.dart';
import '../../repositories/courses_repository.dart';


class SubtopicsListView extends StatelessWidget {
  final int subtopicsCourseId;
  const SubtopicsListView({Key? key, required this.subtopicsCourseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colorCount = ListViewColors.colors.length;
    return FutureBuilder(
      future: CoursesRepository.getCourses(TypeRequest.getSubtopics, subtopicsCourseId),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index){
            colorCount >= (ListViewColors.colors.length - 1) ?
                colorCount = 0 : colorCount++;
            return Padding(
              padding: const EdgeInsets.only(top: 5,
                  left: 30,
                  right: 30,
                  bottom: 5),
              child: Card(
                color: ListViewColors.colors[colorCount],
                child: ListTile(
                  leading: const Icon(Icons.library_books_outlined, color: Colors.black, size: 25),
                  title: Text(snapshot.data![index]["name"], style: TextStyle(fontSize: 16,color: Colors.black,)),
                  subtitle: Text(snapshot.data![index]["specification"], style: TextStyle(fontSize: 14,color: Colors.grey.shade900,)),
                  trailing: const Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Icon(Icons.arrow_right, size: 30, color: Colors.amber,),
                        ),
                        Icon(Icons.arrow_right, size: 30, color: Colors.black,)]),
                  onTap: (){
                    Navigator.of(context).pushNamed("/contentscoursespage", arguments: snapshot.data![index]["id"]);
                  },
                ),
              ),
            );
          },
        );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
