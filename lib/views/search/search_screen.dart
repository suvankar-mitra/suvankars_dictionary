import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';
import 'package:suvankars_dictionary/themes/app_theme.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state and use a button to toggle
    final themeMode = ref.watch(themeProvider);

    // Create a FocusNode for the search bar
    final searchFocusNode = FocusNode();

    final List<String> recentSearchItems = [
      'profound',
      'light',
      'run',
      'never',
      'retro',
    ];

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
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
                          color: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
                        ),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        // Handle search logic here
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // word of the day
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Label
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WORD OF THE DAY',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color:
                                Theme.of(context).textTheme.displaySmall?.color,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'LEARN MORE',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: buttonColor(ref),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Word
                            Text(
                              'example',
                              style: GoogleFonts.merriweather(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.displaySmall?.color,
                              ),
                            ),
                            // const SizedBox(height: 6),

                            // Part of speech
                            Text(
                              '/əɡˈzæmpl̩/',
                              style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color:
                                    themeMode == ThemeMode.dark
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

                const SizedBox(height: 30),

                // recent search list
                recentSearchItems.isNotEmpty
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'RECENT SEARCHES',
                              style: GoogleFonts.robotoSlab(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.displaySmall?.color,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'VIEW ALL',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: buttonColor(ref),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Card(
                          child: Column(
                            children: List.generate(recentSearchItems.length, (
                              index,
                            ) {
                              final item = recentSearchItems[index];
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      item,
                                      style: GoogleFonts.merriweather(
                                        fontSize: 14,
                                        color:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.color,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "noun",
                                      style: GoogleFonts.merriweather(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color!
                                            .withValues(alpha: 0.5),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    trailing: Icon(
                                      FeatherIcons.chevronRight,
                                      color: buttonColor(ref),
                                    ),
                                    onTap: () {},
                                    dense: true,
                                  ),
                                  if (index != recentSearchItems.length - 1)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: Divider(height: 0),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
