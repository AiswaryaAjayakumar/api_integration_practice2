// ignore_for_file: prefer_const_constructors

import 'package:api_integration_practice2/controller/home_screen_controller.dart';
import 'package:api_integration_practice2/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeScreenController(),)],
      child: MaterialApp(
        home: HomeScreen() ,
      ),
    );
  }
}
