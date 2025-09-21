import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('profile')),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFF1E3A8A),
                    child: Text(
                      'JD',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Profile details
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileItem('Phone', '+91 98765 43210'),
                    const Divider(),
                    _buildProfileItem(
                      'Address',
                      '123 Main Street, City, State',
                    ),
                    const Divider(),
                    _buildProfileItem('Date of Birth', 'January 1, 1990'),
                    const Divider(),
                    _buildProfileItem('Occupation', 'Software Engineer'),
                    const Divider(),
                    _buildProfileItem('Annual Income', '₹8,00,000'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Edit profile button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text('Edit Profile'),
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

  Widget _buildProfileItem(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(flex: 2, child: Text(value)),
      ],
    );
  }
}
