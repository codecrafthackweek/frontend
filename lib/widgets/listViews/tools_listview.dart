
import 'package:flutter/material.dart';
import '../../colors/listview_colors.dart';

List<Map<String, dynamic>> toolList = [
  {
    "tool_name": "Calculadora de Juros Compostos",
    "route": "/compoundinterestcalculatorpage",
    "tag": 1
  },
  {
    "tool_name": "Conversor de Moeda",
    "route": "/currencyconverterpage",
    "tag": 2
  },
  {
    "tool_name": "Simulação 50/30/20",
    "route": null,
    "tag": 3
  },
  {
    "tool_name": "Projeção de Salário Líquido",
    "route": null,
    "tag": 4
  },
  {
    "tool_name": "Projeção de Imposto de Renda",
    "route": null,
    "tag": 5
  },
];


class ToolsListView extends StatelessWidget {
  const ToolsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colorCount = ListViewColors.colors.length;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: toolList.length,
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
                leading: Icon(Icons.calculate_outlined, color: Colors.black, size: 25),
                title: Text(toolList[index]["tool_name"], style: TextStyle(fontSize: 16,color: Colors.black,)),
                trailing: const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Icon(Icons.arrow_right, size: 30, color: Colors.amber,),
                              ),
                              Icon(Icons.arrow_right, size: 30, color: Colors.black,)]),
                onTap: toolList[index]["route"] != null ? (){
                  Navigator.of(context).pushNamed(
                      toolList[index]["route"]);
                }:(){},
              ),
            ),
          );
        });
  }
}
