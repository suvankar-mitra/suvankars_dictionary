import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:suvankars_dictionary/providers/theme_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state and use a button to toggle
    final themeMode = ref.watch(themeProvider);

    // Create a FocusNode for the search bar
    final searchFocusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside the search bar
        if (searchFocusNode.hasFocus) {
          searchFocusNode.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Toggle button for dark/light mode
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(
                        themeMode == ThemeMode.dark
                            ? FeatherIcons.sun
                            : FeatherIcons.moon,
                        color:
                            themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
                      ),
                      onPressed: () {
                        // Toggle the theme mode
                        ref.read(themeProvider.notifier).state =
                            themeMode == ThemeMode.dark
                                ? ThemeMode.light
                                : ThemeMode.dark;
                        // Dismiss the keyboard when tapping outside the search bar
                        if (searchFocusNode.hasFocus) {
                          searchFocusNode.unfocus();
                        }
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
                            fontSize:
                                Theme.of(
                                  context,
                                ).textTheme.displayMedium?.fontSize,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(
                                  context,
                                ).textTheme.displayMedium?.color,
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),

                // Search bar
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    focusNode: searchFocusNode,
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
                        ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
                      ),
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        color:
                            themeMode == ThemeMode.dark
                                ? Colors.white54
                                : Colors.black54,
                      ),
                      filled: true,
                      fillColor:
                          themeMode == ThemeMode.dark
                              ? Colors.grey[800]
                              : Colors
                                  .grey[200], // Background color for the search bar
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide.none, // Remove border for a cleaner look
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color:
                              themeMode == ThemeMode.dark
                                  ? Colors.grey[600]!
                                  : Colors.grey[400]!,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      // Handle search logic here
                      print('Search for: $value');
                    },
                  ),
                ),

                const SizedBox(height: 30,),

                // word of the day
                Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  // margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section Label
                        Text(
                          'Word of the Day',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: themeMode == ThemeMode.dark
                                ? Colors.white54
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Word
                        Text(
                          'example',
                          style: GoogleFonts.merriweather(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).textTheme.displaySmall?.color,
                          ),
                        ),
                        // const SizedBox(height: 6),

                        // Part of speech
                        Text(
                          '/əɡˈzæmpl̩/',
                          style: GoogleFonts.merriweather(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: themeMode == ThemeMode.dark
                                ? Colors.white54
                                : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // First definition
                        Text(
                          '1. One or a portion taken to show the character or quality of the whole; a sample; a specimen.',
                          style: GoogleFonts.merriweather(
                            fontSize: 16,
                            height: 1.5,
                            color:
                            Theme.of(
                              context,
                            ).textTheme.bodyLarge?.color,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Second definition
                        Text(
                          '2. That which is to be followed or imitated as a model; a pattern or copy.',
                          style: GoogleFonts.merriweather(
                            fontSize: 16,
                            height: 1.5,
                            color:
                            Theme.of(
                              context,
                            ).textTheme.bodyLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
