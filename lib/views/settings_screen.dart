import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suvankars_dictionary/providers/color_scheme_provider.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';

import '../themes/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state and use a button to toggle
    final themeMode = ref.watch(themeProvider);

    final colorScheme = ref.watch(colorSchemeProvider);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Settings',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.displayMedium?.color,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        // Toggle button for dark/light mode
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    themeMode == ThemeMode.dark
                                        ? FeatherIcons.moon
                                        : FeatherIcons.sun,
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.color,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Toggle theme',
                                        style: GoogleFonts.roboto(
                                          fontSize:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.fontSize,
                                          // fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.color,
                                        ),
                                      ),
                                      Text(
                                        themeMode == ThemeMode.dark
                                            ? 'dark theme activated'
                                            : 'light theme activated',
                                        style: GoogleFonts.roboto(
                                          fontSize:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.fontSize,
                                          // fontWeight: FontWeight.w500,
                                          color:
                                              themeMode == ThemeMode.dark
                                                  ? Colors.grey
                                                  : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              iconSize: 20.0,
                              icon: Icon(
                                FeatherIcons.chevronRight,
                                color: buttonColor(ref),
                              ),
                              onPressed: () {
                                // Toggle the theme mode
                                ref.read(themeProvider.notifier).state =
                                    themeMode == ThemeMode.dark
                                        ? ThemeMode.light
                                        : ThemeMode.dark;
                              },
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(height: 0),
                        ),

                        // Toggle color scheme
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    FeatherIcons.eye,
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.color,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Change color scheme',
                                        style: GoogleFonts.roboto(
                                          fontSize:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.fontSize,
                                          // fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.color,
                                        ),
                                      ),
                                      Text(
                                        'Theme selected pink',
                                        style: GoogleFonts.roboto(
                                          fontSize:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.fontSize,
                                          // fontWeight: FontWeight.w500,
                                          color:
                                              themeMode == ThemeMode.dark
                                                  ? Colors.grey
                                                  : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              iconSize: 20.0,
                              icon: Icon(
                                FeatherIcons.chevronRight,
                                color: buttonColor(ref),
                              ),
                              onPressed: () {
                                if (colorScheme == ColorSchemeOption.pink) {
                                  ref.read(colorSchemeProvider.notifier).state =
                                      ColorSchemeOption.orange;
                                } else if (colorScheme ==
                                    ColorSchemeOption.orange) {
                                  ref.read(colorSchemeProvider.notifier).state =
                                      ColorSchemeOption.lime;
                                } else {
                                  ref.read(colorSchemeProvider.notifier).state =
                                      ColorSchemeOption.pink;
                                }
                              },
                            ),
                          ],
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
