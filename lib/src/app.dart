import 'package:anime_finder/src/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    return Home();
  }
}
