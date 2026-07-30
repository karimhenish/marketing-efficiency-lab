import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onLaunchDemo;

  const HeroSection({
    super.key,
    required this.onLaunchDemo,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 100,
      ),
      child: Column(
        children: [

          const Text(
            "Research Project",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff64748B),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Marketing Efficiency\nIntelligence Lab",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              height: 1.15,
              color: Color(0xff0F172A),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: screenWidth > 900 ? 750 : screenWidth * .9,
            child: const Text(
              "Transforming Marketing Efficiency Measurement into Actionable Business Decisions.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                height: 1.7,
                color: Color(0xff475569),
              ),
            ),
          ),

          const SizedBox(height: 45),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [

              ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1E3A8A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 22,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  "Read Working Paper",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              OutlinedButton(
                onPressed: onLaunchDemo,

                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 22,
                  ),
                  side: const BorderSide(
                    color: Color(0xff1E3A8A),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  "Launch Demo",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1E3A8A),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}