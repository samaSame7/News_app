import 'package:flutter/material.dart';
import 'package:news_7/ui/utils/app_assets.dart';
import 'package:news_7/ui/utils/extension/context_extension.dart';
import 'package:news_7/ui/utils/extension/int_extension.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppAssets.splashLight,
              height: MediaQuery.of(context).size.height * .2,
              fit: BoxFit.cover,
            ),
          ),
          12.verticalSpace(),
          Text("data", style: context.textTheme.bodyMedium),
          12.verticalSpace(),
          Row(
            children: [
              Text("cdsa", style: context.textTheme.labelMedium),
              10.horizontalSpace(),
              Text("cdsa", style: context.textTheme.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
