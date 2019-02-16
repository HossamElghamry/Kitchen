import 'package:flutter/material.dart';
import './screens/login/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Cantina ",
    theme: ThemeData(fontFamily: "Kiona"),
    home: LoginScreen(),
  ));
}
