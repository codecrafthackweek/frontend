
import 'package:flutter/material.dart';


class MyBackButton extends StatelessWidget {
  final String route;
  const MyBackButton({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          if(route != "") {
            Navigator.of(context).pushReplacementNamed(route);
          }else{
            Navigator.of(context).pop();
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Stack(
                children: [
                  Icon(Icons.arrow_back_ios_new, color: Colors.amber, size: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20,),
                  ),
                ],
              ),

              Text("Voltar", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
            ],
          ),
        ));
  }
}
