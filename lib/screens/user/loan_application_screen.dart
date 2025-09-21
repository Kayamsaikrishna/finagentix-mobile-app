import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../services/translation_service.dart';
import '../chatbot_screen.dart';

class LoanApplicationScreen extends StatefulWidget {
  final String loanType;

  const LoanApplicationScreen({super.key, required this.loanType});

  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPurpose;
  String? _employmentType;
  double _loanAmount = 100000;
  int _loanTenure = 12;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final translationService = TranslationService();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.loanType} Application'),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apply for ${widget.loanType}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Loan amount slider
              Text(
                'Loan Amount: ₹${_loanAmount.toInt().toString()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _loanAmount,
                min: 10000,
                max: 1000000,
                divisions: 100,
                label: '₹${_loanAmount.toInt().toString()}',
                onChanged: (value) {
                  setState(() {
                    _loanAmount = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Loan tenure slider
              Text(
                'Loan Tenure: $_loanTenure months',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _loanTenure.toDouble(),
                min: 6,
                max: 60,
                divisions: 54,
                label: '$_loanTenure months',
                onChanged: (value) {
                  setState(() {
                    _loanTenure = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 20),
              // Purpose dropdown
              DropdownButtonFormField<String>(
                value: _selectedPurpose,
                hint: const Text('Select Loan Purpose'),
                items:
                    [
                      'Home Improvement',
                      'Education',
                      'Medical Emergency',
                      'Business Investment',
                      'Debt Consolidation',
                      'Other',
                    ].map((String purpose) {
                      return DropdownMenuItem(
                        value: purpose,
                        child: Text(purpose),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPurpose = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a loan purpose';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Employment type dropdown
              DropdownButtonFormField<String>(
                value: _employmentType,
                hint: const Text('Select Employment Type'),
                items:
                    [
                      'Salaried',
                      'Self Employed',
                      'Business Owner',
                      'Freelancer',
                      'Retired',
                      'Student',
                    ].map((String type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _employmentType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select employment type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle loan application submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Loan application submitted successfully!',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Submit Application'),
                ),
              ),
            ],
          ),
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
