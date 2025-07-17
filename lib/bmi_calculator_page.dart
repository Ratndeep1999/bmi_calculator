import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _height = 55;
  int _weight = 64;
  int _age = 21;
  int _gender = 1; // for male = 1 and female = 2
  double _calculatedBmi = 0.0 ;



  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.orange.shade100,
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
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _gender = 1;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          // gender male
                          color:
                              _gender == 1 ? Colors.white : Colors.yellowAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: Colors.blue.shade500,
                            ),
                            const Text(
                              "Male",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  // Female container
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _gender = 2;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:
                              _gender == 2 ? Colors.white : Colors.yellowAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: Colors.pink.shade500,
                            ),
                            const Text(
                              "Female",
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Height Section
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 18, color: Colors.black26),
                    ),

                    // Text.rich Widget to change small and big String
                    Text.rich(
                      TextSpan(
                        children: [
                          // Text to show Height
                          TextSpan(
                            text: _height.toStringAsFixed(2),
                            // It prints the _height
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // Text for cm string
                          const TextSpan(
                            text: " cm",
                            style: TextStyle(
                              color: Colors.black26,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Slider
                    Slider(
                      // value that i need to pass
                      value: _height,
                      // minimum value
                      min: 55,
                      // maximum value
                      max: 200,
                      inactiveColor: Colors.white,
                      activeColor: Colors.black26,
                      thumbColor: Colors.grey[100],
                      onChanged: (double value) {
                        // _height need to change
                        setState(() {
                          _height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Row for Weight and Age
              Row(
                children: [
                  // Weight Section
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellowAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT (in Kg)",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black26,
                            ),
                          ),
                          Text(
                            _weight.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // row for increment and decrement buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Increment button
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {

                                    _weight = _weight + 1;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),

                              // Decrement button
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if(_weight > 0) {
                                      _weight = _weight - 1;
                                    }
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 35,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  // Age Section
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellowAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE (in Years)",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black26,
                            ),
                          ),
                          Text(
                            _age.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // row for increment and decrement buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Increment button
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _age++;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),

                              // Decrement button
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {

                                    if ( _age > 0) {
                                      _age-- ;
                                    }
                                    setState(() {});
                                  },
                                  onLongPress: () {},
                                  child: Icon(
                                    Icons.remove,
                                    size: 35,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                    double heightInMeter = _height / 100 ;
                    // calculate bmi
                    if( _weight > 0.00 && _age > 0 ) {
                      _calculatedBmi = _weight / (heightInMeter * heightInMeter) ;
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
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellowAccent,
                ),
                child: Center(
                  child: Text(
                    _calculatedBmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
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
