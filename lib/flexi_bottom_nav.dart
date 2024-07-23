library flexi_bottom_nav;
import 'package:flutter/material.dart';

class FlexiBottomNavigation extends StatefulWidget {
  final List<Widget> screens;
  final List<String> labels;
  final List<IconData> icons;
  final int initialIndex;
  final List<Color>? iconColors;
  final double? textSize;
  final double? iconSize;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screens.length != widget.labels.length || widget.screens.length != widget.icons.length) {
      throw ArgumentError('The length of screens, labels, and icons must be the same.');
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
              color: widget.iconColors != null && widget.iconColors!.length > index
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
