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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: const [
  NavBar(),

  HeroSection(),

  StatsSection(),

  ResearchSection(),

  DemoSection(),

  ArchitectureSection(),

  ResultsSection(),

  FooterSection(),
],
        ),
      ),
    );
  }
}