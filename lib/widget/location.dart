// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.secilenSehir,
  }) : super(key: key);

  final String secilenSehir; 

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ankara",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
