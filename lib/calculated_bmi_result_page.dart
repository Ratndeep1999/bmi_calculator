import 'package:bmi_calculator/Widgets/category_health_risk_widget.dart';
import 'package:bmi_calculator/Widgets/suggestion_widget.dart';
import 'package:flutter/material.dart';

class CalculatedBmi extends StatefulWidget {
  const CalculatedBmi({
    super.key,
    required this.bmi,
    required this.isMale
  });

  final double bmi;
  final int isMale ;

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

    // widget.bmi scope available only after build() method (?)
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

    // to assign values at once
    switch( _category ) {
      case 'Underweight' :
        _healthRisk = 'Malnutrition, weakness';
        _suggestions = widget.isMale == 1
            ? "Eat protein-rich food, gain muscle through training."
            : "Add healthy fats, frequent meals, and yoga.";
        _color = Color(0xFF03A9F4);
        break ;

      case 'Normal Weight' :
        _healthRisk = 'Low health risk';
        _suggestions ='Maintain a healthy lifestyle and regular activity.';
        _color = Color(0xFF4CAF50);
        break ;

      case 'Overweight' :
        _healthRisk = 'Moderate risk of heart disease, diabetes';
        _suggestions = widget.isMale == 1
            ? "Reduce red meat, focus on cardio & strength training."
            : "Avoid sugary snacks, walk daily, hydrate well.";
        _color = Color(0xFFFFC107);
        break ;

      case 'Obesity Class I' :
        _healthRisk = 'High risk of cardiovascular disease';
        _suggestions = widget.isMale == 1
            ? "Limit carbs, exercise regularly, monitor sugar."
            : "Daily light cardio, portion control, consult dietician.";
        _color = Color(0xFFFF9800);
        break ;

      case 'Obesity Class II' :
        _healthRisk = 'Very high health risks';
        _suggestions ="Strict diet plan, consult doctor, monitor health.";
        _color = Color(0xFFF44336);
        break ;

      case 'Obesity Class III' :
        _healthRisk = 'Extremely high health risks';
        _suggestions ="Seek medical advice and structured weight-loss plan.";
        _color = Color(0xFFD32F2F);
        break ;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculated BMI"),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
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
              CategoryHealthRiskWidget(
                calculatedBmi: widget.bmi,
                category: _category,
                healthRisk: _healthRisk,
                color: _color,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02), // 15
              /// Suggestions Section
              SuggestionWidget(suggestions: _suggestions, isMale: widget.isMale,),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02), // 15
              // Recalculate button
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  // MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Recalculate",
                      style: TextStyle(
                        color: Colors.black45,
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
