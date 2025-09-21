import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('dashboard')),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translationService.translate('dashboard'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Quick stats cards
            Row(
              children: [
                _buildStatCard(context, 'Active Loans', '2', Colors.blue),
                const SizedBox(width: 15),
                _buildStatCard(context, 'Total Repaid', '₹1.2L', Colors.green),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildStatCard(context, 'Pending', '1', Colors.orange),
                const SizedBox(width: 15),
                _buildStatCard(context, 'Credit Score', '750', Colors.purple),
              ],
            ),
            const SizedBox(height: 30),
            // Recent loans
            Text(
              'Recent Loans',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildLoanItem(
                    'Personal Loan',
                    '₹2,50,000',
                    'Active',
                    '12 months',
                  ),
                  _buildLoanItem(
                    'Home Loan',
                    '₹15,00,000',
                    'Completed',
                    '120 months',
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    Color color,
  ) {
    return Expanded(
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoanItem(
    String title,
    String amount,
    String status,
    String tenure,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(amount),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: status == 'Active' ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(tenure),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle loan item tap
        },
      ),
    );
  }
}
