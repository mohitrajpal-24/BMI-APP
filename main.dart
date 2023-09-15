import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();

  var result = "";

  var bgcolor = Color.fromARGB(255, 66, 81, 198);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 11, 66),
        title: Text('Your BMI Calculator'),
        titleTextStyle: TextStyle(color: Colors.amber, fontSize: 22),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'BMI',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber),
              ),
              SizedBox(
                height: 21,
              ),
              TextField(
                controller: wtcontroller,
                decoration: InputDecoration(
                    label: Text('ENTER YOUR WEIGHT (IN KILOGRAMS)'),
                    labelStyle: TextStyle(color: Colors.amber),
                    prefixIcon: Icon(Icons.line_weight),
                    prefixIconColor: Colors.amber),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color.fromARGB(255, 255, 227, 124)),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text('ENTER YOUR HEIGHT (IN FEET)'),
                    labelStyle: TextStyle(color: Colors.amber),
                    prefixIcon: Icon(Icons.height),
                    prefixIconColor: Colors.amber),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color.fromARGB(255, 255, 227, 124)),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text('ENTER YOUR HEIGHT (IN INCHES)'),
                    labelStyle: TextStyle(color: Colors.amber),
                    prefixIcon: Icon(Icons.height),
                    prefixIconColor: Colors.amber),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 227, 124),
                ),
              ),
              SizedBox(height: 41),
              ElevatedButton(
                onPressed: () {
                  var wt = wtcontroller.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iIn = int.parse(inch);

                    var tInch = (iFt * 12) + iIn;
                    var tcm = tInch * 2.54;
                    var tm = tcm / 100;
                    var bmi = iWt / (tm * tm);
                    var msg = "";
                    if (bmi > 25) {
                      msg = "You're OverWeight!!";
                      bgcolor = Color.fromARGB(255, 197, 101, 101);
                    } else if (bmi < 18) {
                      msg = "You're UnderWeight!!";
                      bgcolor = Color.fromARGB(255, 200, 97, 57);
                    } else {
                      msg = "You're Healthy";
                      bgcolor = Color.fromARGB(255, 82, 171, 85);
                    }
                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });
                  } else {
                    setState(() {
                      result = "please fill all the requried data!!";
                    });
                  }
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 11),
              Text(
                result,
                style: TextStyle(fontSize: 24, color: Colors.amber),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
