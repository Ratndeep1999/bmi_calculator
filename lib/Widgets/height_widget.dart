import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({
    super.key,
    required this.heightChanged
  });

  // method that return height from child class to parent class
  final Function(double) heightChanged ;

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

double _height = 56 ;

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              // setState(() {
              //   _height = value;
              // });

              _height = value ;
              widget.heightChanged(_height);
              setState(() {});

            },
          ),
        ],
      ),
    );
  }
}
