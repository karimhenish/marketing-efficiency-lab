import 'package:flutter/material.dart';

class ResearchSection extends StatelessWidget {
  const ResearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 80,
      ),
      child: Column(
        children: [

          const Text(
            "Research Overview",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 30),

          const SizedBox(
            width: 850,
            child: Text(
              "This research introduces an AI-powered framework that combines Stochastic Frontier Analysis (SFA), CatBoost Machine Learning, and Optimization to measure and improve marketing efficiency.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                height: 1.7,
                color: Color(0xff475569),
              ),
            ),
          ),

          const SizedBox(height: 50),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [

              _tag("SFA"),

              _tag("CatBoost"),

              _tag("Optimization"),

              _tag("Explainable AI"),

            ],
          ),
        ],
      ),
    );
  }

  static Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffEEF4FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xff1E3A8A),
        ),
      ),
    );
  }
}