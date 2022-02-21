import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String? cityName;
  const LocationWidget({
    Key? key,
    this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      cityName.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}
