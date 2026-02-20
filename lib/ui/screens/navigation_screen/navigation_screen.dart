import 'package:flutter/material.dart';
import 'package:news_7/ui/providers/theme_provider.dart';
import 'package:news_7/ui/screens/navigation_screen/tabs/news_tab/news_tab.dart';
import 'package:news_7/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("General")),
      drawer: buildDrawer(context),
      body: NewsTab(),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              color: Colors.white,
              child: Center(
                child: Text(
                  "News App",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Theme",style: TextStyle(color: AppColors.white),),
                  SizedBox(height: 12),
                  DropdownButton<ThemeMode>(
                    value: themeProvider.themeMode,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    dropdownColor: AppColors.black,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: AppColors.white),
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text("Light"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text("Dark"),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) themeProvider.changeTheme(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
