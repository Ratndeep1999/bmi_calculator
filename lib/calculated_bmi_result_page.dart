import 'package:flutter/material.dart';

class CalculatedBmi extends StatefulWidget {
  const CalculatedBmi({
    super.key,
    required this.bmi,
  });

  final double bmi ;

  @override
  State<CalculatedBmi> createState() => _CalculatedBmiState();
}

class _CalculatedBmiState extends State<CalculatedBmi> {

  String _healthRisk = '' ;
  String _category = '' ;
  String _suggestions = '' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculated BMI"),
        centerTitle: true,
        backgroundColor: Colors.orange[100],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.dark_mode, size: 25),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox( height: MediaQuery.of(context).size.height * 0.02 ),  // 15

              /// Result Section
              Container(
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
                  widget.bmi.toStringAsFixed(4),
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45
                  ),
                ),

                // Category
                Text(
                  'Obesity Class III',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 36,
                      fontWeight: FontWeight.w500
                  ),
                ),

                // Health risk
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: [
                      const Text(
                          "Health Risk",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0
                          ),
                          textAlign: TextAlign.center
                      ),
                      // Health Risk
                      Text(
                        'Moderate risk of heart disease, diabetes',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

              SizedBox( height: MediaQuery.of(context).size.height * 0.02 ),  // 15

              /// Suggestions Section
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Center(
                  child: Text (
                      'Increase physical activity (30–45 min/day)'
                  ),
                ),
              ),

              SizedBox( height: MediaQuery.of(context).size.height * 0.02 ),  // 15

              // Recalculate button
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                      "Recalculate",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
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
