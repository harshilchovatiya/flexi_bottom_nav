
# FlexiBottomNavigation

`FlexiBottomNavigation` is a customizable bottom navigation widget for Flutter. It allows you to easily create a bottom navigation bar with configurable icons, labels, and colors, giving you the flexibility to tailor the navigation experience to your app's needs.

## Features

- **Customizable Labels**: Set the labels for each tab in the bottom navigation bar.
- **Adjustable Icons**: Specify icons for each tab, with customizable icon sizes and colors.
- **Color Customization**: Customize the selected and unselected item colors.
- **Text and Icon Sizes**: Adjust the font size for labels and the size for icons.
- **Error Handling**: Ensure consistent behavior with validation for input lengths.

## Getting Started

To use `FlexiBottomNavigation` in your Flutter project, follow these steps:

1. **Add the Dependency**:

   Add `flexi_bottom_nav` to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flexi_bottom_nav:0.0.1
   ```
   ```
   pub add flexi_bottom_nav
   ```

2. **Install the Package**:

   Run `flutter pub get` to install the package.

## Usage

Here’s a simple example of how to use `FlexiBottomNavigation` in your Flutter application:

```dart
import 'package:flutter/material.dart';
import 'package:flexi_bottom_nav/flexi_bottom_nav.dart'; // Adjust if necessary

void main() {
  runApp(MaterialApp(
    home: FlexiBottomNavigation(
      screens: [
        Scaffold(body: Center(child: Text('Screen 1'))),
        Scaffold(body: Center(child: Text('Screen 2'))),
        Scaffold(body: Center(child: Text('Screen 3'))),
      ],
      labels: ['Home', 'Search', 'Profile'],
      icons: [Icons.home, Icons.search, Icons.person],
      iconColors: [Colors.blue, Colors.green, Colors.red],
      textSize: 14.0,
      iconSize: 30.0,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
    ),
  ));
}
```

For more advanced usage and customization, check the example folder included in the package.

## Additional Information

- **Documentation**: For detailed documentation, refer to the [package documentation](https://pub.dev/packages/flexi_bottom_nav).
- **Contributing**: Contributions are welcome! Please check the [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute.
- **Issues**: If you encounter any issues, please file them on the [issue tracker](https://github.com/harshilchovatiya/flexi_bottom_nav/issues).
- **License**: This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


