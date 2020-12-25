import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'resultpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = TextEditingController(text: "");

  void clear(){
    t1.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope App",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Horoscope App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                accountEmail: Text("horoscopeapp@gmail.com",style: TextStyle(fontSize: 15,color: Colors.white),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purple[300],
                  child: Text("HA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
            ),
            ListTile(
              title: Text("Today's Horoscope",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.wb_sunny,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
              },
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey[700],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              title: Text("Close",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.close,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset("assests/horoscope.jpg",height:273,width: 400,fit: BoxFit.cover,),
            Padding(padding: const EdgeInsets.only(top: 8)),
            Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.wb_sunny,color: Colors.purple[300],),
                  labelText: "Enter Your Sun Sign:",
                  labelStyle: TextStyle(fontSize: 25,color: Colors.purple[300],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: t1,
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child : Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ResultPage(details: t1.text,)));
                    },
                  color: Colors.purple[300],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                RaisedButton(
                  child : Text("Clear",style: TextStyle(fontSize: 20,color: Colors.purple[300],fontWeight: FontWeight.bold),),
                  onPressed: clear,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
