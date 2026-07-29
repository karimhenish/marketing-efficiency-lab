import 'package:flutter/material.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  final List<Map<String, dynamic>> steps = const [
    {
      "icon": Icons.dataset_outlined,
      "title": "Dataset",
    },
    {
      "icon": Icons.cleaning_services_outlined,
      "title": "Data Cleaning",
    },
    {
      "icon": Icons.analytics_outlined,
      "title": "SFA",
    },
    {
      "icon": Icons.psychology_alt_outlined,
      "title": "CatBoost",
    },
    {
      "icon": Icons.auto_graph_outlined,
      "title": "Optimization",
    },
    {
      "icon": Icons.api_outlined,
      "title": "FastAPI",
    },
    {
      "icon": Icons.language_outlined,
      "title": "Flutter Web",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 80,
      ),
      child: Column(
        children: [

          const Text(
            "System Architecture",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "End-to-end AI pipeline for measuring and optimizing marketing efficiency.",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 60),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: steps.map((step) {
              return Container(
                width: 160,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [

                    Icon(
                      step["icon"],
                      size: 40,
                      color: const Color(0xff1E3A8A),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      step["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}