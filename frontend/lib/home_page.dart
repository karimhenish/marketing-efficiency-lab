import 'package:flutter/material.dart';
import 'package:marketing_eff/widgets/app_drawer.dart';
import 'package:marketing_eff/widgets/navbar.dart';
import 'package:marketing_eff/widgets/research_section.dart';

import 'widgets/hero_section.dart';
import 'widgets/stats_section.dart';
import 'widgets/architecture_section.dart';
import 'widgets/demo_section.dart';
import 'widgets/results_section.dart';
import 'widgets/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey demoKey = GlobalKey();
  void scrollToDemo() {
    final context = demoKey.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),

            HeroSection(onLaunchDemo: scrollToDemo),

            const StatsSection(),

            const ResearchSection(),

            DemoSection(key: demoKey),

            const ArchitectureSection(),

            const ResultsSection(),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
