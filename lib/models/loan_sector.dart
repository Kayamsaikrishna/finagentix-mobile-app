class LoanSector {
  final String id;
  final String name;
  final String description;
  final String amountRange;
  final String interestRate;
  final String tenure;

  LoanSector({
    required this.id,
    required this.name,
    required this.description,
    required this.amountRange,
    required this.interestRate,
    required this.tenure,
  });

  static List<LoanSector> getLoanSectors() {
    return [
      LoanSector(
        id: 'personal',
        name: 'Personal Loan',
        description: 'Quick personal loans with minimal documentation',
        amountRange: '₹2L - ₹15L',
        interestRate: '12.5%',
        tenure: '12-60 months',
      ),
      LoanSector(
        id: 'home',
        name: 'Home Loan',
        description: 'Home loan for purchasing residential property',
        amountRange: '₹5L - ₹5Cr',
        interestRate: '8.5%',
        tenure: '5-25 years',
      ),
      LoanSector(
        id: 'vehicle',
        name: 'Vehicle Loan',
        description: 'Car and two-wheeler loans with competitive rates',
        amountRange: '₹2L - ₹50L',
        interestRate: '9.5%',
        tenure: '1-7 years',
      ),
      LoanSector(
        id: 'business',
        name: 'Business Loan',
        description: 'Working capital and expansion loans for MSMEs',
        amountRange: '₹1L - ₹1Cr',
        interestRate: '14.0%',
        tenure: '1-5 years',
      ),
      LoanSector(
        id: 'education',
        name: 'Education Loan',
        description: 'Education loan for higher studies in India and abroad',
        amountRange: '₹1L - ₹75L',
        interestRate: '10.5%',
        tenure: '5-15 years',
      ),
      LoanSector(
        id: 'agriculture',
        name: 'Agriculture Loan',
        description: 'Comprehensive agricultural loans for farmers',
        amountRange: '₹50K - ₹20L',
        interestRate: '7.0%',
        tenure: '6-36 months',
      ),
      LoanSector(
        id: 'gold',
        name: 'Gold Loan',
        description: 'Instant loan against gold jewelry',
        amountRange: '₹10K - ₹20L',
        interestRate: '12.0%',
        tenure: '6-36 months',
      ),
      LoanSector(
        id: 'credit-card',
        name: 'Credit Card',
        description: 'Premium credit cards with exclusive rewards',
        amountRange: '₹50K - ₹20L',
        interestRate: '42.0%',
        tenure: 'Revolving',
      ),
      LoanSector(
        id: 'two-wheeler',
        name: 'Two Wheeler Loan',
        description: 'Quick loan for two-wheeler purchase',
        amountRange: '₹30K - ₹3L',
        interestRate: '13.5%',
        tenure: '1-3 years',
      ),
      LoanSector(
        id: 'healthcare',
        name: 'Healthcare Loan',
        description: 'Emergency loan for medical expenses',
        amountRange: '₹25K - ₹10L',
        interestRate: '14.5%',
        tenure: '6-48 months',
      ),
      LoanSector(
        id: 'digital',
        name: 'Digital Loan',
        description: 'Completely digital loan with instant approval',
        amountRange: '₹5K - ₹5L',
        interestRate: '18.0%',
        tenure: '3-24 months',
      ),
      LoanSector(
        id: 'microfinance',
        name: 'Microfinance',
        description: 'Small business start-ups and income generation',
        amountRange: '₹15K - ₹1L',
        interestRate: '16.0%',
        tenure: '6-36 months',
      ),
    ];
  }
}