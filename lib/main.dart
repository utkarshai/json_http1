 import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() async{
  List _data = await getJson();
  String _body = "";
  String _title = "";
  //String _data = await getJson();
 // print(_data);// here we can also print zeroth, first, second etc. indexes as print(_data[0]), print(data[1])
  print(_data[0]['userId']);// we can also acccess it like this
  for(int i=0; i< _data.length; i++)
    {
      print( "Title: \t${_data[i]['title']}");
      print("body: \t${_data[i]['body']}");
      print("userid: \t${_data[i]['userId']}");

    }
    _body=_data[0]['body'];

  _title=_data[0]['title'];
  runApp(MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("json parse"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child:
          new ListView.builder(
            itemCount: _data.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int position)
              {
                if(position.isOdd)

                  return new Divider();
                final index = position ~/2;
                return new ListTile(
                  title: new Text("${_data[index]['title']}",
                    style: TextStyle(fontSize: 15.9),
                  ),
                  subtitle: new Text("${_data[index]['body']}",
                    style: TextStyle(
                        fontSize: 13.4,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic),
                  ),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: new Text("${_data[index]['body'][0].toString().toUpperCase()}",
                      style: TextStyle(
                            fontSize: 19.4,
                          color: Colors.amber),

                    ),

                  ),
              onTap: () {_showOnTapMessage(context, "${_data[index]['title']}");}

                );
              }
          )//Text("body...\n$_body  \n\n title:\t $_title"),
      )
    )
  ));
}
//Future<String> getJson()async{
//  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//
//  http.Response response = await http.get(apiUrl);
//
//  return json.decode(response.body).toString();//returns a list type and now it converted to string
//
//}
Future<List> getJson()async{
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';//apiurl can be changfed by thgere name because it is just a String ttype

  http.Response response = await http.get(apiUrl);// here response can be changed by another name, it is just  tyhere to catch the refrense

  return json.decode(response.body);//returns a list type and now it converted to string if we write tostring();
}
void _showOnTapMessage(BuildContext context, String message)
{
  var alert = new AlertDialog(
    title: new Text('App'),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);},
          child: new Text('ok'))
    ],
  );
  showDialog(context: context, builder: (BuildContext context)=> alert);// its a predefined for future type
}


