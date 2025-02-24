import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xFF0A0A26)}) => ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      primaryColor: color,
      hintColor: const Color(0xFFbebebe),
    );
