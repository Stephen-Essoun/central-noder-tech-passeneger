
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate <String>{

  final towns = [
    'Kotokoraba',
    'Abura',
    'Pedu', 
    'Ankafo',
    'Adisadel',
    'Bakaano',
    'Solace',
    'Eskido',
    'Station',
  ];
  final  recent = [
     'Pedu',
    'Ankafo',
    'Adisadel'
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){}, icon: Icon(Icons.cancel))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){}, 
    icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
     progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      child: Center(child: Text('Adom Gifty'),),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recent
    :towns.where((p)=>p.startsWith((query))).toList();
    
    return ListView.builder(itemBuilder: ((context, index) =>ListTile(
      onTap: () {buildResults(context);},
      leading: Icon(Icons.location_disabled),
      title:RichText(text: TextSpan(
        text: suggestionList[index].substring(0,query.length),
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        children: [
          TextSpan(text:suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey)
          )
        ]
      )),
    ) ),
    itemCount: suggestionList.length,
    );
  }
  
}