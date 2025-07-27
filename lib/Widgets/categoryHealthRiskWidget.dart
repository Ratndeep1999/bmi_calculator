import 'package:flutter/material.dart';

class CategoryHealthRiskWidget extends StatelessWidget {
  const CategoryHealthRiskWidget({
    super.key,
    required double calculatedBmi,
    required String category,
    required String healthRisk,
    required Color color,
  }) : _calculatedBmi = calculatedBmi,
       _category = category,
       _healthRisk = healthRisk,
       _color = color;

  final double _calculatedBmi;
  final String _category;
  final String _healthRisk;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28, // 50%
      width: MediaQuery.of(context).size.width, // 20%
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellowAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // bmi
          Text(
            _calculatedBmi.toStringAsFixed(4),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
          ),

          // Category
          Text(
            _category,
            style: TextStyle(
              color: _color,
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Health risk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  "Health Risk",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Health Risk
                Text(
                  _healthRisk,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: _color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
