import 'package:flutter/material.dart';

class CustomColors {
  final Color _primaryColor = const Color.fromARGB(255, 216, 27, 96);
  final Color _secundaryColor = const Color.fromRGBO(255, 228, 236, 1);
  final Color _terciaryColor = const Color.fromARGB(255, 255, 188, 213);
  final Color _quaternaryColor = const Color.fromARGB(255, 255, 188, 213);
  final Color _detailsColor = const Color.fromARGB(255, 255, 255, 255);

  Color getActivePrimaryColor() {
    return _primaryColor;
  }

  Color getActiveSecondaryColor() {
    return _secundaryColor;
  }

  Color getActiveTerciaryColor() {
    return _terciaryColor;
  }

  Color getActiveQuaternaryColor() {
    return _quaternaryColor;
  }

  Color getActiveDetailsColor() {
    return _detailsColor;
  }
}
