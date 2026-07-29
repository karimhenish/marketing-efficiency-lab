import 'package:flutter/material.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        children: [

          const Text(
            "Marketing Efficiency Lab",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),

          const Spacer(),

          TextButton(onPressed: () {}, child: const Text("Research")),
          TextButton(onPressed: () {}, child: const Text("Methodology")),
          TextButton(onPressed: () {}, child: const Text("Results")),

          const SizedBox(width: 20),

          ElevatedButton(
            onPressed: () {},
            child: const Text("Try Demo"),
          ),
        ],
      ),
    );
  }
}