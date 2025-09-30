import 'package:anime_alive/core/constants.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/screens/home_screen.dart';
import 'package:anime_alive/features/anime_home_screen/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    AnimeHomeScreen(),
    Center(child: Text(AppString.community)),
    Center(child: Text(AppString.search)),
    Center(child: Text(AppString.language)),
    Center(child: Text(AppString.settings)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
