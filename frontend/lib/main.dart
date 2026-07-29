import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MarketingEfficiencyApp());
}

class MarketingEfficiencyApp extends StatelessWidget {
  const MarketingEfficiencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Marketing Efficiency Intelligence Lab",
      theme: ThemeData(fontFamily: "IBMPlexSans"),
      home: const HomePage(),
    );
  }
}