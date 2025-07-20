import 'package:bmi_calculator/Widgets/height_widget.dart';
import 'package:bmi_calculator/Widgets/select_gender_widget.dart';
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
  int _gender = 0 ; // 1 for male and 2 for female
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
                  SelectGenderWidget(
                    isMale: true,
                    isSelected: _gender == 1,  // false value passing
                    selectGender: (bool male) {
                      _gender = male ? 1 : 2 ;
                      setState(() {});
                      print(_gender);
                    },
                  ),

                  SizedBox(width: 15),

                  // Female Container
                  SelectGenderWidget(
                    isMale: false,
                    isSelected: _gender == 2,   // false value passing
                    selectGender: (bool female) {
                      _gender = female ? 1 : 2 ;
                      setState(() {});
                      print(_gender);
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Height Section
              HeightWidget(
                // value directly assign to _height which get from child class
                heightChanged: (double height) {
                  _height = height ;
                  print("Changed Height : $_height");
                },
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
              CalculatedBmi(
                  calculatedBmi: _calculatedBmi
              ),
            ],
          ),
        ),
      ),
    );
  }
}
