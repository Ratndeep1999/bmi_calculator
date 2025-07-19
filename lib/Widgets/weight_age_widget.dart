import 'package:flutter/material.dart';

import 'inc_dec_button_widget.dart';

class WeightAgeWidget extends StatefulWidget {
  const WeightAgeWidget ({
    super.key,
    required this.label
  });

  // to store name of weight and age
  final String label;

  @override
  State<WeightAgeWidget> createState() => _WeightAgeWidgetState();
}

class _WeightAgeWidgetState extends State<WeightAgeWidget> {
  // to get the value of _weight
  int _weight = 0;

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
              _weight.toString(),
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
                      print("Weight Increase");
                      _weight = _weight + 1;
                      setState(() {});
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
                      print("Weight Decrease");
                      _weight = _weight - 1;
                      setState(() {});
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
