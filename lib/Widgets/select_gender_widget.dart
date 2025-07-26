import 'package:flutter/material.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({
    super.key,
    required this.isMale,
    required this.selectGender,
    required this.isSelected,
  });

  //
  final bool isMale;

  //
  final Function(bool) selectGender;

  //
  final bool isSelected ;


  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.selectGender(widget.isMale);  // I am passing both true and false to make condition according male and female
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color condition for gender
            color: widget.isSelected ?  Colors.white : Colors.yellowAccent ,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.isMale ? Icons.male : Icons.female,
                size: 100,
                color: widget.isMale ? Colors.blueAccent : Colors.pinkAccent,
              ),
              Text(
                widget.isMale ? "Male" : "Female",
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
    );
  }
}
