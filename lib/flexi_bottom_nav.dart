/// A library for creating a customizable bottom navigation bar.
library flexi_bottom_nav;

import 'package:flutter/material.dart';

/// A customizable bottom navigation bar that allows for dynamic
/// icons, labels, and screens. It supports various configurations
/// such as icon colors, text size, and more.
///
/// This widget enables a flexible bottom navigation experience
/// by specifying a list of screens, labels, and icons.
class FlexiBottomNavigation extends StatefulWidget {
  /// Creates a new instance of [FlexiBottomNavigation].
  ///
  /// The [screens], [labels], and [icons] parameters are required
  /// and must all be of the same length. The [initialIndex] parameter
  /// specifies the starting index for the selected screen.
  /// The remaining parameters are optional and used for customization.
  const FlexiBottomNavigation({
    super.key,
    required this.screens,
    required this.labels,
    required this.icons,
    this.initialIndex = 0,
    this.iconColors,
    this.textSize,
    this.iconSize,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  /// List of screens to display in the body of the [Scaffold].
  final List<Widget> screens;

  /// List of labels for the bottom navigation bar items.
  final List<String> labels;

  /// List of icons for the bottom navigation bar items.
  final List<IconData> icons;

  /// Index of the initially selected screen.
  final int initialIndex;

  /// List of colors for the icons in the bottom navigation bar.
  /// If not provided, default colors will be used.
  final List<Color>? iconColors;

  /// The size of the text in the bottom navigation bar labels.
  /// If not provided, the default size will be used.
  final double? textSize;

  /// The size of the icons in the bottom navigation bar.
  /// If not provided, the default size will be used.
  final double? iconSize;

  /// Color of the selected item in the bottom navigation bar.
  /// Defaults to amber if not provided.
  final Color? selectedItemColor;

  /// Color of the unselected items in the bottom navigation bar.
  /// Defaults to grey if not provided.
  final Color? unselectedItemColor;

  @override
  State<FlexiBottomNavigation> createState() => _FlexiBottomNavigationState();
}

class _FlexiBottomNavigationState extends State<FlexiBottomNavigation> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  /// Updates the selected index when an item is tapped.
  ///
  /// [index] The index of the tapped item.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screens.length != widget.labels.length ||
        widget.screens.length != widget.icons.length) {
      throw ArgumentError(
        'The length of screens, labels, and icons must be the same.',
      );
    }

    return Scaffold(
      body: widget.screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          widget.labels.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              widget.icons[index],
              size: widget.iconSize ?? 24.0, // Default size
              color: widget.iconColors != null &&
                      widget.iconColors!.length > index
                  ? widget.iconColors![index]
                  : Colors.grey, // Default color if not specified
            ),
            label: widget.labels[index],
            tooltip: widget.labels[index],
          ),
        ),
        currentIndex: _selectedIndex,
        selectedItemColor: widget.selectedItemColor ?? Colors.amber[800],
        unselectedItemColor: widget.unselectedItemColor ?? Colors.grey,
        onTap: _onItemTapped,
        showSelectedLabels: widget.textSize != null,
        showUnselectedLabels: widget.textSize != null,
        selectedLabelStyle: widget.textSize != null
            ? TextStyle(fontSize: widget.textSize)
            : null,
        unselectedLabelStyle: widget.textSize != null
            ? TextStyle(fontSize: widget.textSize)
            : null,
      ),
    );
  }
}
