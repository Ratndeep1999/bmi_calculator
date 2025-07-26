import 'package:flutter/material.dart';

class CalculatedBmi extends StatefulWidget {
  const CalculatedBmi({super.key, required this.bmi});

  final double bmi;

  @override
  State<CalculatedBmi> createState() => _CalculatedBmiState();
}

class _CalculatedBmiState extends State<CalculatedBmi> {
  String _category = '';
  String _healthRisk = '';
  String _suggestions = '';
  Color _color = Colors.black26 ;

  @override
  Widget build(BuildContext context) {

    // widget.bmi scope available only after build() method
    if (widget.bmi < 18.5) {
      _category = 'Underweight' ;
    } else if (widget.bmi < 25) {
      _category = 'Normal Weight' ;
    } else if (widget.bmi < 30) {
      _category = 'Overweight' ;
    } else if (widget.bmi < 35) {
      _category = 'Obesity Class I' ;
    } else if (widget.bmi < 40) {
      _category = 'Obesity Class II' ;
    } else {
      _category = 'Obesity Class III' ;
    }

    //
    switch( _category ) {
      case 'Underweight' :
        _healthRisk = '';
        _suggestions ='';
        _color = Colors.black;
        break ;
    }

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02), // 15
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
                        color: Colors.black45,
                      ),
                    ),

                    // Category
                    Text(
                      _category,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Health risk
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
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
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02), // 15
              /// Suggestions Section
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Center(
                  child: Text(
                    _suggestions,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02), // 15
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
