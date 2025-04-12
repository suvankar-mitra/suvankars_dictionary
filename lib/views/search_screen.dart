import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:suvankars_dictionary/providers/theme_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state and use a button to toggle
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Toggle button for dark/light mode
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    iconSize: 30.0,
                    icon: Icon(
                      themeMode == ThemeMode.dark
                          ? FontAwesomeIcons.sun
                          : FontAwesomeIcons.moon,
                    ),
                    onPressed: () {
                      ref.read(themeProvider.notifier).state =
                          themeMode == ThemeMode.dark
                              ? ThemeMode.light
                              : ThemeMode.dark;
                    },
                  ),
                ],
              ),

              // App title
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Dictionary',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.headlineLarge?.color,
                        ),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                  ],
                ),
              ),

              // Search bar
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search for a word ...',
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(FontAwesomeIcons.magnifyingGlass),
                      onPressed: () {
                        // Implement search functionality
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
