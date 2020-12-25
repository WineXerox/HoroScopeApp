import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {

  final String details;
  ResultPage({this.details,});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Map horoscopedetails;
  fetchdetails() async {
    http.Response response = await http.get("http://horoscope-api.herokuapp.com/horoscope/today/"+widget.details);
    setState(() {
      horoscopedetails = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchdetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text("Your Horoscope",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: horoscopedetails == null ? 
      Center(
        child: CircularProgressIndicator(),
      ) :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Sun Sign : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              Text(horoscopedetails["sunsign"],style: TextStyle(fontSize: 30,color: Colors.purple[300],fontWeight: FontWeight.bold),),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Date : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              Text(horoscopedetails["date"],style: TextStyle(fontSize: 30,color: Colors.purple[300],fontWeight: FontWeight.bold),),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Horoscope For The Day : ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              Text(horoscopedetails["horoscope"],style: TextStyle(fontSize: 20,color: Colors.purple[300],fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 20)),
          RaisedButton(
            padding: const EdgeInsets.all(10),
            child : Text("Go Back",style: TextStyle(fontSize: 25,color: Colors.purple[300],fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ],
      ),
    );
  }
}