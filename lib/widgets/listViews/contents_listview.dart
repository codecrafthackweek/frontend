
import 'package:flutter/material.dart';
import '../../repositories/courses_repository.dart';


class ContentsListView extends StatefulWidget {
  final int contentsSubtopicId;
  const ContentsListView({Key? key, required this.contentsSubtopicId}) : super(key: key);

  @override
  State<ContentsListView> createState() => _ContentsListViewState();
}

class _ContentsListViewState extends State<ContentsListView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CoursesRepository.getCourses(TypeRequest.getContents, widget.contentsSubtopicId),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                child: Text(snapshot.data![index]["subtopic"]["name"], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: index == 0 ? null : (){index--;setState(() {});},
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(snapshot.data![index]["description"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: index >= (snapshot.data!.length - 1) ? null : (){index++;setState(() {});},
                        icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 40, right: 40, bottom:  5),
                    child: Text("Página ${index+1} de ${snapshot.data!.length}")),
              ),
            ],
          );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
