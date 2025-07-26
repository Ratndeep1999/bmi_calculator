import 'package:bmi_calculator/Widgets/height_widget.dart';
import 'package:bmi_calculator/Widgets/select_gender_widget.dart';
import 'package:bmi_calculator/Widgets/weight_age_widget.dart';
import 'package:bmi_calculator/calculated_bmi_result_page.dart';
import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();     //   setState() method calls this method
  // State createState() => _BmiCalculatorPageState();  // i can write this also
  // State createState() {                              // even i can write this also
  //   return _BmiCalculatorPageState();
  // }

}

// class _BmiCalculatorPageState extends State {      // even i can also write like this
class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _height = 55;
  int _weight = 64;
  int _age = 21;
  int _gender = 0 ; // 1 for male and 2 for female
  double _calculatedBmi = 0.0;

  @override
  Widget build(BuildContext context) {   // build method which return type is widget
    return Scaffold(
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
              SizedBox( height: MediaQuery.of(context).size.height * 0.04 ),
              // Gender Section
              Row(
                children: [
                  // Male container
                  SelectGenderWidget(
                    isMale: true,  // value passing from parent to child class
                    isSelected: _gender == 1,  // false value passing
                    selectGender: (bool male) {  //  it initialize only when the method call from child class
                      _gender = male ? 1 : 2 ;
                      setState(() {});   // it trigger createState() method to return / rebuild entire UI
                      debugPrint(_gender.toString());
                    },
                  ),

                  SizedBox( width: MediaQuery.of(context).size.width * 0.04 ),

                  // Female Container
                  SelectGenderWidget(
                    isMale: false,
                    isSelected: _gender == 2,   // false value passing
                    selectGender: (bool female) {
                      _gender = female ? 1 : 2 ;
                      setState(() {});
                      debugPrint(_gender.toString());
                    },
                  ),
                ],
              ),

              SizedBox( height: MediaQuery.of(context).size.height * 0.03 ),

              // Height Section
              HeightWidget(
                // value directly assign to _height which get from child class
                heightChanged: (double height) {
                  _height = height ;
                  debugPrint("Changed Height : $_height");
                },
              ),

              SizedBox( height: MediaQuery.of(context).size.height * 0.03 ),

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
                      debugPrint("Weight : $_weight");
                    },
                  ),

                  SizedBox( width: MediaQuery.of(context).size.width * 0.04 ),

                  /// Age Section
                  WeightAgeWidget(
                    label: 'AGE (in Years)',
                    // this string assign to child class label means pass value from parent class to child class
                    weightAgeChanged: (int age) {
                      // this method get value from child class
                      _age =
                          age; // age value assign to parent class private member "_age"
                      debugPrint("Age : $_age");
                    },
                  ),
                ],
              ),

              SizedBox( height: MediaQuery.of(context).size.height * 0.03 ),

              // Calculate Button
              InkWell(
                onTap: () {
                  // cm to meter
                  double heightInMeter = _height / 100;
                  // calculate bmi
                  if (_weight > 0.00 && _age > 0) {
                    _calculatedBmi =
                        _weight / (heightInMeter * heightInMeter);
                    debugPrint(_calculatedBmi.toString());
                  }
                  setState(() { });
                  // It navigate to result page
                  Navigator.push( context,
                    MaterialPageRoute(
                    builder: (context) => CalculatedBmi(
                      bmi: _calculatedBmi, isMale: _gender,
                    ),
                    ),
                  );
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

            ],
          ),
        ),
      ),
    );
  }
}
