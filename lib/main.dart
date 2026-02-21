import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_7/data/repository/news_repository/data_sources/local_data_source/app_local_data_source.dart';
import 'package:news_7/ui/providers/theme_provider.dart';
import 'package:news_7/ui/screens/splash_screen/splash_screen.dart';
import 'package:news_7/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeProvider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: SplashScreen(),
    );
  }
}
