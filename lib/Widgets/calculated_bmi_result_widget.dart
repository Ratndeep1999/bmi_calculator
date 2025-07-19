import 'package:flutter/material.dart';

class CalculatedBmi extends StatelessWidget {
  const CalculatedBmi({super.key, required double calculatedBmi})
    : _calculatedBmi = calculatedBmi;

  final double _calculatedBmi;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellowAccent,
      ),
      child: Center(
        child: Text(
          _calculatedBmi.toStringAsFixed(2),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
