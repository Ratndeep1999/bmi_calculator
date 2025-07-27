import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    super.key,
    required String suggestions,
    required int isMale
  }) : _suggestions = suggestions, _isMale = isMale ;

  final String _suggestions ;
  final int _isMale ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellowAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isMale == 1 ? 'Male' : 'Female',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: _isMale == 1 ? Colors.blue : Colors.pink
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              _suggestions,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
