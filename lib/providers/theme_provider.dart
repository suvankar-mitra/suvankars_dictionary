import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Define a provider for theme mode
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
