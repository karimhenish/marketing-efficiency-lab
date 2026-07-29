import 'package:flutter/material.dart';

class DemoSection extends StatelessWidget {
  const DemoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 90,
      ),
      color: const Color(0xffF8FAFC),
      child: Column(
        children: [
          const Text(
            "Interactive AI Demo",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(
            width: 800,
            child: Text(
              "Experience the Marketing Efficiency Intelligence Lab by analyzing a company's data and receiving AI-powered predictions and optimization recommendations.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                height: 1.7,
                color: Color(0xff475569),
              ),
            ),
          ),

          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1E3A8A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 22,
              ),
            ),
            child: const Text(
              "Launch Interactive Demo",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}