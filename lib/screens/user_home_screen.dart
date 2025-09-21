import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/loan_sector.dart';
import '../providers/app_provider.dart';
import '../services/translation_service.dart';
import 'chatbot_screen.dart';
import 'user/dashboard_screen.dart';
import 'user/loans_screen.dart';
import 'user/profile_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const UserDashboardScreen(),
    const UserLoansScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF1E3A8A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: translationService.translate('dashboard'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance),
            label: translationService.translate('loans'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: translationService.translate('profile'),
          ),
        ],
      ),
      floatingActionButton: appProvider.isTutorialEnabled
          ? FloatingActionButton(
              onPressed: () {
                // Show tutorial
              },
              backgroundColor: Colors.yellow,
              foregroundColor: const Color(0xFF1E3A8A),
              child: const Icon(Icons.info),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
