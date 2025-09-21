import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('admin_app')),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
              child: Text(
                'Fin-Agentix Admin',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: Text(translationService.translate('dashboard')),
              onTap: () {
                // Handle dashboard tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: Text(translationService.translate('marketplace')),
              onTap: () {
                // Handle marketplace tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.handshake),
              title: Text(translationService.translate('partners')),
              onTap: () {
                // Handle partners tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance),
              title: Text(translationService.translate('consumption_loans')),
              onTap: () {
                // Handle consumption loans tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: Text(translationService.translate('loan_applications')),
              onTap: () {
                // Handle loan applications tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text(translationService.translate('users')),
              onTap: () {
                // Handle users tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: Text(translationService.translate('analytics')),
              onTap: () {
                // Handle analytics tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: Text(translationService.translate('reports')),
              onTap: () {
                // Handle reports tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(translationService.translate('settings')),
              onTap: () {
                // Handle settings tap
              },
            ),
          ],
        ),
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
            // Stats cards
            Row(
              children: [
                _buildStatCard(
                  context,
                  translationService.translate('total_applications'),
                  '128',
                  Colors.blue,
                ),
                const SizedBox(width: 15),
                _buildStatCard(
                  context,
                  translationService.translate('approved_loans'),
                  '87',
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildStatCard(
                  context,
                  translationService.translate('pending_approval'),
                  '23',
                  Colors.orange,
                ),
                const SizedBox(width: 15),
                _buildStatCard(
                  context,
                  translationService.translate('total_revenue'),
                  '₹2.4Cr',
                  Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              translationService.translate('recent_activity'),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Recent activity list
            Expanded(
              child: ListView(
                children: [
                  _buildActivityItem(
                    translationService.translate('new_application'),
                    'John Doe applied for Personal Loan',
                    '2 mins ago',
                  ),
                  _buildActivityItem(
                    translationService.translate('loan_approved'),
                    'Application #12345 approved',
                    '15 mins ago',
                  ),
                  _buildActivityItem(
                    translationService.translate('document_uploaded'),
                    'Aadhaar document uploaded by Jane Smith',
                    '1 hour ago',
                  ),
                  _buildActivityItem(
                    translationService.translate('disbursement_completed'),
                    '₹50,000 disbursed to Company XYZ',
                    '2 hours ago',
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String description, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF1E3A8A),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications, color: Colors.white, size: 20),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
