import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suvankars_dictionary/models/dictionary_entry.dart';
import 'package:suvankars_dictionary/providers/dictionary_def_provider.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';
import 'package:suvankars_dictionary/themes/app_theme.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current theme state and use a button to toggle
    final themeMode = ref.watch(themeProvider);

    final List<String> words = [
      'ephemeral',
      'sonorous',
      'susurrus',
      'soliloquy',
      'quixotic',
      'defenestration',
      'halcyon',
      'zephyr',
    ];

    final Random random = Random();
    final String word = words[random.nextInt(words.length)];

    // Access dictionary entries
    final dictionaryEntries = ref.watch(dictionaryDefProvider(word));

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

                    dictionaryEntries.when(
                      data: (dictionaryEntries) {
                        if (dictionaryEntries.isEmpty) {
                          return const Center(
                            child: Text("No definitions found."),
                          );
                        }

                        DictionaryEntry dictionaryEntry =
                            dictionaryEntries.first;
                        for (DictionaryEntry e in dictionaryEntries) {
                          if (e.definitions.length > 1) {
                            dictionaryEntry = e;
                            break;
                          }
                        }

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Word
                                Text(
                                  dictionaryEntry.entryWord,
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
                                  dictionaryEntry.partsOfSpeech.first,
                                  style: GoogleFonts.notoSans(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color:
                                        themeMode == ThemeMode.dark
                                            ? Colors.white54
                                            : Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // First definition
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: '1. '),
                                      TextSpan(
                                        text:
                                            dictionaryEntry
                                                .definitions
                                                .first
                                                .definition ??
                                            'No definition found',
                                      ),
                                    ],
                                    style: GoogleFonts.merriweather(
                                      fontSize: 16,
                                      height: 1.5,
                                      color:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyLarge?.color,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Second definition
                                if (dictionaryEntry.definitions.length > 1)
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(text: '2. '),
                                        TextSpan(
                                          text:
                                              dictionaryEntry
                                                  .definitions[1]
                                                  .definition ??
                                              'No definition found',
                                        ),
                                      ],
                                      style: GoogleFonts.merriweather(
                                        fontSize: 16,
                                        height: 1.5,
                                        color:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.color,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      error: (err, _) => Center(child: Text("Error: $err")),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
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
                          elevation: 0,
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
                                      "12 hours ago",
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
