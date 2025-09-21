import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/loan_sector.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class UserLoansScreen extends StatelessWidget {
  const UserLoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();
    final loanSectors = LoanSector.getLoanSectors();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('loans')),
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatbotScreen()),
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(translationService.translate('profile')),
                onTap: () {
                  // Handle profile tap
                },
              ),
              PopupMenuItem(
                child: Text(translationService.translate('settings')),
                onTap: () {
                  // Handle settings tap
                },
              ),
              PopupMenuItem(
                child: Text(translationService.translate('logout')),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Loan sectors header
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              translationService.translate('loan_sectors'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Loan sectors grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: loanSectors.length,
              itemBuilder: (context, index) {
                final sector = loanSectors[index];

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getSectorIcon(sector.id),
                        size: 40,
                        color: const Color(0xFF1E3A8A),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        translationService.translate('${sector.id}_loan'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        sector.amountRange,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${sector.interestRate} | ${sector.tenure}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Handle loan application
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A8A),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(translationService.translate('apply')),
                      ),
                    ],
                  ),
                );
              },
            ),
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
    );
  }

  IconData _getSectorIcon(String sectorId) {
    switch (sectorId) {
      case 'personal':
        return Icons.person;
      case 'home':
        return Icons.home;
      case 'vehicle':
        return Icons.directions_car;
      case 'business':
        return Icons.business;
      case 'gold':
        return Icons.diamond;
      case 'education':
        return Icons.school;
      case 'agriculture':
        return Icons.eco;
      case 'microfinance':
        return Icons.account_balance;
      case 'credit-card':
        return Icons.credit_card;
      case 'two-wheeler':
        return Icons.motorcycle;
      case 'healthcare':
        return Icons.local_hospital;
      case 'digital':
        return Icons.phone_android;
      default:
        return Icons.account_balance;
    }
  }
}
