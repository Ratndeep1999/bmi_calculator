import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _height = 181;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("BMI Calculator", style: TextStyle()),
        backgroundColor: Colors.orange.shade100,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 15),

              // Gender Section
              Row(
                children: [
                  // Male container
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellowAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 100,
                            color: Colors.blue.shade500,
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  // Female container
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellowAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 100,
                            color: Colors.pink.shade500,
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Height Section
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 18, color: Colors.black26),
                    ),

                    // Text.rich Widget to change small and big String
                    Text.rich(
                      TextSpan(
                        children: [

                          // Text to show Height
                          TextSpan(
                            text: _height.toStringAsFixed(2),
                            // It prints the _height
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // Text for cm string
                          const TextSpan(
                            text: " cm",
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      value: _height,
                      min: 55,
                      max: 200,
                      onChanged: (double value) {
                        _height = value;
                        setState(() {
                          print("$_height");
                        });
                      },
                    ),
                  ],
                ),
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Big ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'Small', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
