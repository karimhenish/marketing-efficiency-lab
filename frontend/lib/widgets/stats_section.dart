import 'package:flutter/material.dart';
import 'stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 60,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 25,
        runSpacing: 25,
        children: const [
          StatCard(
            value: "30,435+",
            title: "Firm-Year\nObservations",
          ),
          StatCard(
            value: "4,107",
            title: "Companies",
          ),
          StatCard(
            value: "27",
            title: "Years",
          ),
          StatCard(
            value: "CatBoost + SFA",
            title: "AI Optimization\nFramework",
          ),
        ],
      ),
    );
  }
}