# Flutter DropdownButton Demo

A comprehensive Flutter application demonstrating the implementation and usage of DropdownButton widgets in a real-world profile settings scenario.

## Overview

This project showcases a **Profile Settings Screen** with three interactive dropdown menus for:
- **Country Selection** - Choose from 7 different countries
- **Language Selection** - Pick from 6 available languages  
- **Notification Frequency** - Set notification preferences

The app features a clean, card-based UI with real-time updates and a summary section showing current selections.

## Features

### Core Functionality
- **Three Independent Dropdowns** - Country, Language, and Notification settings
- **Real-time State Management** - Immediate UI updates on selection changes
- **Dynamic Summary Display** - Shows current selections in a dedicated section
- **Responsive Layout** - Clean, card-based design with proper spacing

### UI/UX Highlights
- **Material Design** - Follows Flutter's Material Design principles
- **Card-based Layout** - Each dropdown section is contained in an elevated card
- **Visual Feedback** - Clear indication of selected vs unselected states
- **Color-coded Interface** - Blue theme with consistent color scheme

## Project Structure

```
lib/
├── main.dart              # Main application entry point
├── MyApp                  # Root widget with MaterialApp configuration
└── ProfileSettingsScreen  # Main screen containing all dropdowns
    ├── State Management   # Handles dropdown selections
    ├── UI Components      # Dropdown sections and summary
    └── Helper Methods     # Reusable widget builders
```

## 🔧 Technical Implementation

### State Management
```dart
// Three main state variables
String? selectedCountry;
String? selectedLanguage; 
String? selectedNotificationFreq;
```

### Data Structure
- **Static Lists** - Pre-defined options for each dropdown
- **Nullable Strings** - Allow for unselected states
- **setState()** - Flutter's built-in state management for UI updates

### Key Components

#### 1. Dropdown Section Builder
```dart
Widget _buildDropdownSection(
  String title,
  String hint,
  String? selectedValue,
  List<String> options,
  Function(String?) onChanged,
)
```
- **Reusable Method** - Reduces code duplication
- **Parameterized** - Flexible for different dropdown types
- **Consistent Styling** - Maintains uniform appearance

#### 2. Summary Section
- **Real-time Updates** - Reflects current selections immediately
- **Null Handling** - Shows "Not selected" for empty states
- **Visual Distinction** - Different styling for selected vs unselected

## Data Options

### Countries (7 options)
- United States, Canada, United Kingdom, Australia, Germany, France, Japan

### Languages (6 options)  
- English, Spanish, French, German, Japanese, Chinese

### Notification Frequencies (5 options)
- Immediately, Daily, Weekly, Monthly, Never

## Design Specifications

### Color Scheme
- **Primary Color**: Blue (`Colors.blue`)
- **App Bar**: Blue background with white text
- **Cards**: White background with subtle elevation
- **Summary Section**: Light blue background (`Colors.blue[50]`)

### Typography
- **Main Title**: 24px, Bold, Blue[800]
- **Section Titles**: 18px, Bold, Blue[800]
- **Dropdown Labels**: 16px, Bold
- **Summary Text**: Default with weight variations

### Layout
- **Padding**: 20px main container, 16px card interiors
- **Spacing**: 16px between sections, 30px before summary
- **Elevation**: Cards have 2-3 elevation for depth

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- IDE (VS Code, Android Studio, or IntelliJ)

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/ThierrySHYAKA/dropdown_button_demo.git
   cd dropdown_button_demo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## Key Learning Points

### DropdownButton Implementation
- **Generic Type**: `DropdownButton<String>` for type safety
- **Required Properties**: `items`, `onChanged`
- **Optional Properties**: `hint`, `value`, `isExpanded`
- **Item Mapping**: Converting List to DropdownMenuItem widgets

### State Management Best Practices
- **Nullable Variables** - Handle unselected states gracefully
- **setState() Usage** - Trigger UI rebuilds on state changes
- **Separation of Concerns** - Keep data separate from UI logic

### UI Architecture
- **Reusable Components** - Helper methods for consistent UI
- **Card-based Layout** - Organized, scannable interface
- **Responsive Design** - Works across different screen sizes

## Usage Examples

### Basic DropdownButton
```dart
DropdownButton<String>(
  hint: Text('Select option'),
  value: selectedValue,
  isExpanded: true,
  items: options.map((String option) {
    return DropdownMenuItem<String>(
      value: option,
      child: Text(option),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  },
)
```

### State Update Pattern
```dart
onChanged: (String? newValue) {
  setState(() {
    selectedCountry = newValue;
  });
}
```

## Future Enhancements

### Possible Improvements
- **Data Persistence** - Save selections using SharedPreferences
- **Form Validation** - Add validation for required fields
- **API Integration** - Fetch dropdown options from external API
- **Animations** - Add smooth transitions between states
- **Theming** - Support for dark/light mode switching

### Advanced Features
- **Multi-select Dropdowns** - Allow multiple selections
- **Search Functionality** - Filter options in large lists
- **Custom Styling** - Enhanced visual customization
- **Accessibility** - Screen reader support and keyboard navigation

## Screenshots
![alt text](<Screenshot (27).png>)

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [DropdownButton Class](https://api.flutter.dev/flutter/material/DropdownButton-class.html)
- [Material Design Guidelines](https://material.io/design)
- [Dart Language Guide](https://dart.dev/guides/language)
