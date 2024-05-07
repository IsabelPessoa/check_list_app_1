import 'package:flutter/material.dart';

class CustomColors {
  Color _PrimaryColor = Color.fromARGB(255, 216, 27, 96);
  Color _SecundaryColor = Color.fromARGB(255, 252, 228, 236);
  Color _DetailsColor = Colors.white;

  Color getActivePrimaryColor() {
    return _PrimaryColor;
  }
  Color getActiveSecondaryColor() {
    return _SecundaryColor;
  }
  Color getActiveDetailsColor() {
    return _DetailsColor;
  }
}
