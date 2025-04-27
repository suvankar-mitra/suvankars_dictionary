import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';
import 'package:suvankars_dictionary/themes/app_theme.dart';
import 'package:suvankars_dictionary/views/home/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current theme mode from the provider
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: appLightTheme(ref),
      darkTheme: appDarkTheme(ref),
      home: const HomeScreen(),
    );
  }
}
