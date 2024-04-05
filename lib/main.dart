import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(WidgetsApp());
}

class WidgetsApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widgets App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: DashboardPage(),
    );
  }


}

class DashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Dashboard"),
      ),
      body: Center(



        child: Container(
          height: 200,
          width: 200,

          child: Text(

            "Hello This is My First Dashboard",
            style: TextStyle(fontWeight:FontWeight.bold,
            backgroundColor: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic),

          ),
        ),


      ),
    );
  }
}
class imageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images"),
      ),
      body: Center(

          child: Image(
            image: AssetImage('assets/mustakim.jpg'),
          )
      ),

    );
  }

}