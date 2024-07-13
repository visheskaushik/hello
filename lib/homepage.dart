import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var a1Controller = TextEditingController();
  var a2Controller = TextEditingController();
  var calculator = ["+", "-", "/", "%", "^", "*",];
  var operator = "+";
  var result = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: Colors.red.withOpacity(0.5),
                size: 100,
              ),
              SizedBox(height: 11),

              TextField(
                controller: a1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Enter the first number", style: TextStyle(color: Colors.black)),
                  prefixIcon: Icon(Icons.input_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: operator,
                    icon: Icon(Icons.keyboard_arrow_down,size:50),
                    dropdownColor: Colors.pinkAccent,
                    items: calculator.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.yellow,fontSize:50)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        operator = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: a2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Enter the second number", style: TextStyle(color: Colors.black)),
                  prefixIcon: Icon(Icons.input_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 11),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double num1 = double.tryParse(a1Controller.text) ?? 0;
                    double num2 = double.tryParse(a2Controller.text) ?? 0;

                    switch (operator) {
                      case "+":
                        result = (num1 + num2).toString();
                        break;
                      case "-":
                        result = (num1 - num2).toString();
                        break;
                      case "/":
                        result = num2 != 0 ? (num1 / num2).toString() : "Error";
                        break;
                      case "%":
                        result = num2 != 0 ? (num1 % num2).toString() : "Error";
                        break;
                      case "^":
                        result = pow(num1, num2).toString();
                        break;
                      case "*":
                        result = (num1 * num2).toString();
                        break;


                      default:
                        result = "Invalid operator";
                    }
                  });
                },
                child: Text("Result"),
              ),
              SizedBox(height: 11),
              Text(
                "$result",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}
