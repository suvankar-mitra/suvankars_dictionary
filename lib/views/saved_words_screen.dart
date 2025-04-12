import 'package:flutter/material.dart';

class SavedWordsScreen extends StatelessWidget {
  const SavedWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Saved words screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
