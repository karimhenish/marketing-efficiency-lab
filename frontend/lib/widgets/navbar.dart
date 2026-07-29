import 'package:flutter/material.dart';
import 'package:marketing_eff/widgets/desktopNavBar.dart';
import 'package:marketing_eff/widgets/mobileNavBar.dart';
import '../responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const DesktopNavBar()
        : const MobileNavBar();
  }
}