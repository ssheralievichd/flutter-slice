import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter FSD'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Ready to build!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
