import 'package:flutter/material.dart';

class MaxveMinSicaklikWidget extends StatelessWidget {
  const MaxveMinSicaklikWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Maksimum :" + 24.toString() + "°C",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Maksimum :" + 24.toString() + "°C",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
