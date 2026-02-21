import 'package:flutter/material.dart';
import 'package:news_7/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            color: AppColors.white,
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
                Text(
                  "Theme",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: AppColors.white),
                ),
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
                    if (value != null) {
                      themeProvider.changeTheme(value);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
