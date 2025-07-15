import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileSettingsScreen(),
    );
  }
}

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  // State variables for our three dropdowns
  String? selectedCountry;
  String? selectedLanguage;
  String? selectedNotificationFreq;
  
  // Data lists for our dropdowns
  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Japan',
  ];
  
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Japanese',
    'Chinese',
  ];
  
  final List<String> notificationFrequencies = [
    'Immediately',
    'Daily',
    'Weekly',
    'Monthly',
    'Never',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Configure Your Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 20),
            
            // Country Dropdown
            _buildDropdownSection(
              'Country',
              'Select your country',
              selectedCountry,
              countries,
              (String? newValue) {
                setState(() {
                  selectedCountry = newValue;
                });
              },
            ),
            
            SizedBox(height: 16),
            
            // Language Dropdown
            _buildDropdownSection(
              'Language',
              'Select your language',
              selectedLanguage,
              languages,
              (String? newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
            ),
            
            SizedBox(height: 16),
            
            // Notification Dropdown
            _buildDropdownSection(
              'Notifications',
              'Select notification frequency',
              selectedNotificationFreq,
              notificationFrequencies,
              (String? newValue) {
                setState(() {
                  selectedNotificationFreq = newValue;
                });
              },
            ),
            
            SizedBox(height: 30),
            
            // Summary section
            _buildSummarySection(),
          ],
        ),
      ),
    );
  }

  // Helper method to build each dropdown section
  Widget _buildDropdownSection(
    String title,
    String hint,
    String? selectedValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              hint: Text(hint),
              value: selectedValue,
              isExpanded: true,
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  // Summary section to show current selections
  Widget _buildSummarySection() {
    return Card(
      elevation: 3,
      color: Colors.blue[50],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 12),
            _buildSummaryItem('Country', selectedCountry),
            _buildSummaryItem('Language', selectedLanguage),
            _buildSummaryItem('Notifications', selectedNotificationFreq),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value ?? 'Not selected',
            style: TextStyle(
              color: value != null ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
