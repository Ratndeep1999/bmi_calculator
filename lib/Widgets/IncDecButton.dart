

import 'package:flutter/material.dart';

class IncDecButton extends StatelessWidget {
  const IncDecButton({super.key,});

  //


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        // _weight = _weight + 1;
        // setState(() {});
      },
      child: Icon(
        Icons.add,
        size: 35,
        color: Colors.black26,
      ),
    );
  }
}