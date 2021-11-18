import 'package:flutter/material.dart';
import 'package:river_water_level/pages/rivers_page_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rivers water level",
      debugShowCheckedModeBanner: false,
      home: RiversPageWrapper(),
    );
  }
}
