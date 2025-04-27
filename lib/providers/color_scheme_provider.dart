import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSchemeProvider = StateProvider<ColorSchemeOption>(
  (ref) => ColorSchemeOption.lime,
);

enum ColorSchemeOption { pink, lime, orange }
