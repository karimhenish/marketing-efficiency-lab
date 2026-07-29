import 'package:flutter/material.dart';

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            "MEL",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          const Spacer(),

          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
