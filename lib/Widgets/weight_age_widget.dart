import 'package:flutter/material.dart';

import 'inc_dec_button_widget.dart';

class WeightAgeWidget extends StatefulWidget {
  const WeightAgeWidget ({
    super.key,
    required this.label,
    required this.weightAgeChanged
  });

  // variable to set value from parent class to child class
  final String label;

  // method to return value from child to parent class
  final Function(int) weightAgeChanged ;

  @override
  State<WeightAgeWidget> createState() => _WeightAgeWidgetState();
}

class _WeightAgeWidgetState extends State<WeightAgeWidget> {

  // to get the value of _weight and _age
  int _weight_Age = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.yellowAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              widget.label,
              style: TextStyle(fontSize: 18, color: Colors.black26),
            ),
            Text(
              _weight_Age.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
            ),
            // row for increment and decrement buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Increment button
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child:
                  /// Weight Increment
                  IncDecButtonWidget(
                    isIncrement: true,
                    onClick: () {
                      print("WeightAge Increase");
                      _weight_Age = _weight_Age + 1;  // it increase weight and age to 1 when user click
                      setState(() {});   // it rebuild widgets
                      widget.weightAgeChanged(_weight_Age);   // this method return weight to parent class when the value set
                    },
                  ),
                ),

                // Decrement button
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child:
                  /// Weight decrement
                  IncDecButtonWidget(
                    isIncrement: false,
                    onClick: () {
                      print("WeightAge Decrease");
                      _weight_Age = _weight_Age - 1;   // // it decrease weight and age to 1 when user click
                      setState(() {});
                      widget.weightAgeChanged(_weight_Age);   // this method return weight to parent class when the value set
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
