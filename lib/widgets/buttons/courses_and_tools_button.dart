
import 'package:flutter/material.dart';

enum CurrentPage{
  courses,
  tools
}


class CoursesAndToolsButton extends StatelessWidget {
  final CurrentPage currentPage;
  const CoursesAndToolsButton({Key? key, required this.currentPage}) :
          super(key: key);

  @override
  Widget build(BuildContext context) {
    double x;
    currentPage == CurrentPage.courses ? x = 1 : x = 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "DCF", style: TextStyle(
                            fontSize: 22,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),),
                          TextSpan(text: "inance", style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                              ..color = Colors.black,
                          )),
                        ]
                    )),
                RichText(
                text: const TextSpan(
                    children: [
                      TextSpan(text: "D", style: TextStyle(color: Color(0xff011f4b), fontWeight: FontWeight.bold, fontSize: 22)),
                      TextSpan(text: "C", style: TextStyle(color: Color(0xff011f4b), fontWeight: FontWeight.bold, fontSize: 22)),
                      TextSpan(text: "F", style: TextStyle(color: Color(0xff011f4b), fontWeight: FontWeight.bold, fontSize: 22)),
                      TextSpan(text: "inance", style: TextStyle(color: Color(0xff011f4b), fontWeight: FontWeight.bold, fontSize: 20)),
                    ]
                )),
              ],
            ),
          ),
        ),
        Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,
                        left: 30,
                        right: 30,
                        bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,
                                left: 20,
                                right: 5,
                                bottom: 10),
                            child: ElevatedButton(
                              onPressed:currentPage == CurrentPage.tools ? (){
                                Navigator.of(context).pushReplacementNamed(
                                    "/courseshomepage");
                              } : (){},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(150, 40),
                                backgroundColor: currentPage == CurrentPage.courses ?
                                                  Colors.amber.shade400 : Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7))
                              ),
                              child: Text("Cursos",
                                      style: TextStyle(
                                        color: currentPage == CurrentPage.courses ?
                                                Colors.black87 : Colors.black38,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600
                                      )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,
                                left: 5,
                                right: 20,
                                bottom: 10),
                            child: ElevatedButton(
                              onPressed:currentPage == CurrentPage.courses ? (){
                                Navigator.of(context).pushReplacementNamed(
                                    "/toolshomepage");
                              } : (){},
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 40),
                                  backgroundColor: currentPage == CurrentPage.tools ?
                                                    Colors.amber.shade400 : Colors.grey.shade300,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))
                              ),
                              child: Text("Ferramentas",
                                  style: TextStyle(
                                      color: currentPage == CurrentPage.tools ?
                                              Colors.black87 : Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
      ],
    );
  }
}


