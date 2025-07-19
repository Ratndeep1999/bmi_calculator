import 'package:bmi_calculator/Widgets/inc_dec_button_widget.dart';
import 'package:bmi_calculator/Widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';

import 'Widgets/calculated_bmi_result_widget.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _height = 55;
  int _weight = 64;
  int _age = 21;
  int _gender = 0;

  double _calculatedBmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              // Dark mode
              child: Icon(Icons.dark_mode, size: 25),
            ),
          ),
        ],
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("BMI Calculator", style: TextStyle()),
        backgroundColor: Colors.yellowAccent,
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
                    child: InkWell(
                      onTap: () {
                        _gender = 1;
                        setState(() {});
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          // color condition for gender
                          color:
                              _gender == 1 ? Colors.white : Colors.yellowAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: Colors.blueAccent,
                            ),
                            Text(
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
                  ),

                  SizedBox(width: 15),

                  // Female Container
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _gender = 2;
                        setState(() {});
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          // color condition for gender
                          color:
                              _gender == 2 ? Colors.white : Colors.yellowAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: Colors.pinkAccent,
                            ),
                            Text(
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

                    // Slider
                    Slider(
                      // value that i need to pass
                      value: _height,
                      // minimum value
                      min: 55,
                      // maximum value
                      max: 200,
                      inactiveColor: Colors.white,
                      activeColor: Colors.black26,
                      thumbColor: Colors.grey[100],
                      onChanged: (double value) {
                        // _height need to change
                        setState(() {
                          _height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Row for Weight and Age
              Row(
                children: [
                  /// Weight Section
                  WeightAgeWidget(
                    label: 'WEIGHT (in Kg)',
                    // this string assign to child class label means pass value from parent class to child class
                    weightAgeChanged: (int weight) {
                      // this method get value from child class
                      _weight =
                          weight; // weight value assign to parent class private member "_weight"
                      print("Weight : $_weight");
                    },
                  ),

                  SizedBox(width: 15),

                  /// Age Section
                  WeightAgeWidget(
                    label: 'AGE (in Years)',
                    // this string assign to child class label means pass value from parent class to child class
                    weightAgeChanged: (int age) {
                      // this method get value from child class
                      _age =
                          age; // age value assign to parent class private member "_age"
                      print("Age : $_age");
                    },
                  ),
                ],
              ),

              // SizedBox(height: 30),
              SizedBox(height: 10),

              // Calculate Button
              InkWell(
                onTap: () {
                  setState(() {
                    // cm to meter
                    double heightInMeter = _height / 100;
                    // calculate bmi
                    if (_weight > 0.00 && _age > 0) {
                      _calculatedBmi =
                          _weight / (heightInMeter * heightInMeter);
                    }
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),

              // Result
              CalculatedBmi(calculatedBmi: _calculatedBmi),
            ],
          ),
        ),
      ),
    );
  }
}
