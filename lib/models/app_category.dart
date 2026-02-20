import 'package:news_7/ui/utils/app_assets.dart';

class AppCategory {
  String name;
  String imageDark;
  String imageLight;

  AppCategory(
      {required this.name, required this.imageDark, required this.imageLight});

  static List<AppCategory> categories = [
    AppCategory(
        name: "General",
        imageDark: AppAssets.generalDark,
        imageLight: AppAssets.generalLight),
    AppCategory(
        name: "Business",
        imageDark: AppAssets.businessDark,
        imageLight: AppAssets.businessLight),
    AppCategory(
        name: "Sports",
        imageDark: AppAssets.sportDark,
        imageLight: AppAssets.sportLight),
    AppCategory(
        name: "Technology",
        imageDark: AppAssets.technologyDark,
        imageLight: AppAssets.technologyLight),
    AppCategory(
        name: "Entertainment",
        imageDark: AppAssets.entertainmentDark,
        imageLight: AppAssets.entertainmentLight),
    AppCategory(
        name: "Health",
        imageDark: AppAssets.healthDark,
        imageLight: AppAssets.healthLight),
    AppCategory(
        name: "Science",
        imageDark: AppAssets.scienceDark,
        imageLight: AppAssets.scienceLight),

  ];
}