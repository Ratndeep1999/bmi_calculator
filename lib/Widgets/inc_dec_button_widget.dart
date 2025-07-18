import 'package:flutter/material.dart';

class IncDecButtonWidget extends StatelessWidget {
  const IncDecButtonWidget({
    super.key,
    required this.isIncrement,
    required this.onClick,
  });

  // for icon
  final bool isIncrement;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Icon(
        // if true then plus, if false then minus
        (isIncrement) ? Icons.add : Icons.remove,
        size: 35,
        color: Colors.black26,
      ),
    );
  }
}
