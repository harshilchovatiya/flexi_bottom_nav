import 'package:flutter_test/flutter_test.dart';

import 'package:flexi_bottom_nav/flexi_bottom_nav.dart';
import 'package:flutter/material.dart'; 

void main() {
  testWidgets('BottomNavigation widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FlexiBottomNavigation(
          screens: [
            Scaffold(body: Center(child: Text('Screen 1'))),
            Scaffold(body: Center(child: Text('Screen 2'))),
          ],
          labels: ['Home', 'Search'],
          icons: [Icons.home, Icons.search],
        ),
      ),
    );

    // Verify that the widget displays the labels
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);

    // Verify that the icons are displayed
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
