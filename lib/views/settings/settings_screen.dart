import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suvankars_dictionary/providers/color_scheme_provider.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';
import 'package:suvankars_dictionary/themes/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state
    final themeMode = ref.watch(themeProvider);
    // Access the current color scheme
    final colorScheme = ref.watch(colorSchemeProvider);

    const leadingIconSize = 26.0;

    const WidgetStateProperty<Icon> thumbIcon =
        WidgetStateProperty<Icon>.fromMap(<WidgetStatesConstraint, Icon>{
          WidgetState.selected: Icon(FeatherIcons.moon, size: 20.0),
          WidgetState.any: Icon(FeatherIcons.sun, size: 20.0),
        });

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

                // UI settings
                Card(
                  elevation: 0.0,
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
                                    Icons.brightness_5_outlined,
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.color,
                                    size: leadingIconSize,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 40.0,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Switch(
                                    thumbIcon: thumbIcon,
                                    value: themeMode == ThemeMode.dark,
                                    thumbColor: WidgetStateProperty.all<Color>(
                                      buttonColor(ref),
                                    ),
                                    inactiveThumbColor: buttonColor(ref),
                                    activeTrackColor:
                                        themeMode == ThemeMode.dark
                                            ? Colors.grey.shade400
                                            : Colors.black54,
                                    inactiveTrackColor:
                                        themeMode == ThemeMode.dark
                                            ? Colors.grey
                                            : Colors.grey.shade200,
                                    onChanged: (bool value) {
                                      ref.read(themeProvider.notifier).state =
                                          themeMode == ThemeMode.dark
                                              ? ThemeMode.light
                                              : ThemeMode.dark;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // divider
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
                                    Icons.palette_outlined,
                                    color:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.color,
                                    size: leadingIconSize,
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select accent color',
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

                                      // radio button to change color scheme
                                      _buildColorSchemeOption(ref),
                                    ],
                                  ),
                                ],
                              ),
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

  Widget _buildColorSchemeOption(WidgetRef ref) {
    ColorSchemeOption selectedOption = ref.watch(colorSchemeProvider);

    // Colors options
    final Map<Color, ColorSchemeOption> colorOptions = {
      getPinkColor(ref): ColorSchemeOption.pink,
      getLimeColor(ref): ColorSchemeOption.lime,
      getOrangeColor(ref): ColorSchemeOption.orange,
      getBlueColor(ref): ColorSchemeOption.blue,
      getRedColor(ref): ColorSchemeOption.red,
    };

    Color selectedColor =
        colorOptions.entries
            .firstWhere((entry) => entry.value == selectedOption)
            .key;

    return Row(
      children:
          colorOptions.keys.map((Color color) {
            return Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Radio<Color>(
                  value: color,
                  groupValue: selectedColor,
                  fillColor: WidgetStateProperty.all(color),
                  onChanged: (Color? value) {
                    ref.read(colorSchemeProvider.notifier).state =
                        colorOptions[color]!;
                  },
                ),
              ),
            );
          }).toList(),
    );
  }
}
