import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSchemeProvider = StateProvider<ColorSchemeOption>(
  (ref) => ColorSchemeOption.pink,
);

enum ColorSchemeOption { pink, lime, orange, blue, red }
