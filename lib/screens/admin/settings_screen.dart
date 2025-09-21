import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  String _selectedLanguage = 'en';
  bool _twoFactorAuth = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('settings')),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translationService.translate('settings'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Language selection
            Card(
              child: ListTile(
                title: Text(translationService.translate('select_language')),
                trailing: DropdownButton<String>(
                  value: _selectedLanguage,
                  items: [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'hi', child: Text('हिंदी')),
                    DropdownMenuItem(value: 'ta', child: Text('தமிழ்')),
                    DropdownMenuItem(value: 'te', child: Text('తెలుగు')),
                    DropdownMenuItem(value: 'kn', child: Text('ಕನ್ನಡ')),
                    DropdownMenuItem(value: 'ml', child: Text('മലയാളം')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                      // Update language in the app
                      translationService.changeLanguage(value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Security settings
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Two-Factor Authentication'),
                    value: _twoFactorAuth,
                    onChanged: (value) {
                      setState(() {
                        _twoFactorAuth = value;
                      });
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Change Password'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle change password
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Manage API Keys'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle API keys management
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Notifications settings
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Enable Notifications'),
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text('Email Notifications'),
                    value: _emailNotifications,
                    onChanged: _notificationsEnabled
                        ? (value) {
                            setState(() {
                              _emailNotifications = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text('SMS Notifications'),
                    value: _smsNotifications,
                    onChanged: _notificationsEnabled
                        ? (value) {
                            setState(() {
                              _smsNotifications = value;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // System settings
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('System Preferences'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle system preferences
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Audit Logs'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle audit logs
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Backup & Restore'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle backup and restore
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged out successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(translationService.translate('logout')),
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
}
