

import 'package:flutter/material.dart';
import 'package:travel_app/data/theme.dart';
import 'package:travel_app/ui/screens/feed_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TravelTheme.theme,
      home: const FeedScreen(),
    );
  }
}