import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'BMI Calculator',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Body Mass Index',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight(in Kgs)',
                          style: TextStyle(fontSize: 15)),
                      prefixIcon: Icon(Icons.line_weight_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in feet)',
                          style: TextStyle(fontSize: 15)),
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height(in Inches)',
                          style: TextStyle(fontSize: 15)),
                      prefixIcon: Icon(Icons.height_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iWt / (tM * tM);

                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are OverWeight!!";
                            bgColor = Colors.orange;
                          } else if (bmi < 18) {
                            msg = "You are UnderWeight!!";
                            bgColor = Colors.red;
                          } else {
                            msg = "You are Healthy!!";
                            bgColor = Colors.green;
                          }

                          setState(() {
                            result =
                                " $msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the  required blank!!";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(50, 50),
                      ),
                      child: Text(
                        'Calculator',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
