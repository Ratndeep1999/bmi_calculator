import 'package:flutter/material.dart';

class CalculatedBmi extends StatelessWidget {
  const CalculatedBmi({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 20),

              // Result Section
              Container(
                height: MediaQuery.of(context).size.height * 0.43, // 50%
                width: MediaQuery.of(context).size.width, // 20%
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    const Text(
                      "Your BMI is",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 40,
                        color: Colors.black26,
                      ),
                    ),
                    Text("0.0")
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Suggestions Section
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
              ),

              SizedBox(height: 20),

              // Recalculate button
              InkWell(
                onTap: () {},
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
