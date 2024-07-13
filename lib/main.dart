import 'package:calculator_project/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Center(child:Text("Calculator")),
           backgroundColor: Colors.blue,
        ),
        body:Container(

          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate, size: 300,),
                ElevatedButton(onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage(),));
                }, child: Text("Click",style:TextStyle(fontSize:10,fontWeight: FontWeight.bold)))

              ],

            ),

          ),


        ),
      backgroundColor: Colors.orange,
    );
  }
}
