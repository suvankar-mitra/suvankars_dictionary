import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suvankars_dictionary/providers/theme_provider.dart';
import 'package:suvankars_dictionary/views/saved_words_screen.dart';
import 'package:suvankars_dictionary/views/search_screen.dart';
import 'package:suvankars_dictionary/views/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SearchScreen(),
    SavedWordsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: themeMode == ThemeMode.dark
                    ? Colors.white12
                    : Colors.black12,
                width: 2.0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.bookmark),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.settings),
                label: 'Settings',
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              size: 30.0,
              color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
            ),
            unselectedIconTheme: IconThemeData(
              size: 20.0,
              color: themeMode == ThemeMode.dark ? Colors.grey : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
