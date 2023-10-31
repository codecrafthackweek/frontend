
import 'dart:convert';
import 'package:http/http.dart';


enum TypeRequest{
 getCourses,
 getSubtopics,
 getContents,
 getQuizzes,
}

class CoursesRepository{
  static Future<List<dynamic>> getCourses(TypeRequest typeRequest, int? id) async {

    String route = switch (typeRequest) {
                                           TypeRequest.getCourses => "/api/Course",
                                           TypeRequest.getSubtopics => "/api/Subtopic/Course/$id",
                                           TypeRequest.getContents => "/api/Content/Subtopic/$id",
                                           TypeRequest.getQuizzes => "/api/Quiz/Subtopic/$id",
                                        };

    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept':'*/*'
      };

    Uri uri = Uri.http("34.234.69.99:8080", route);

    Response response = await get(uri, headers: headers);

    if(response.statusCode != 200){
      throw "unexpected http error: ${response.statusCode}";
    }

    var jsonResponse = jsonDecode(response.body);

    if (typeRequest == TypeRequest.getCourses){
      jsonResponse.add(
          {
            "id": 1,
            "name": "Aposentadoria",
            "tag": "Avançado"
          });

      jsonResponse.add(
          {
            "id": 1,
            "name": "Tipos de Contas",
            "tag": "Avançado"
          });
    }

    return jsonResponse;
  }
}

/*


 */