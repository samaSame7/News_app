import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_7/models/app_category.dart';
import 'package:news_7/models/source.dart';
import 'package:news_7/ui/utils/app_resource.dart';
import 'news_list.dart';
import 'news_view_model.dart';

class NewsTab extends StatefulWidget {
  final AppCategory category;

  const NewsTab(this.category, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadSources(widget.category.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          if (state.sourceApi.status == ApiStatus.error) {
            return Center(child: Text(state.sourceApi.errorMessage ?? ""));
          } else if (state.sourceApi.status == ApiStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return buildTabsList(state.sourceApi.data ?? []);
          }
        },
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => NewsViewModel(),
    //   child: Builder(
    //     builder: (context) {
    //       return Consumer<NewsViewModel>(
    //         builder: (context, viewModel, _) {
    //           this.viewModel = viewModel;
    //           if (viewModel.sourceApi.status == ApiStatus.error) {
    //             return Center(
    //               child: Text(viewModel.sourceApi.errorMessage ?? ""),
    //             );
    //           } else if (viewModel.sourceApi.status == ApiStatus.loading) {
    //             return Center(child: CircularProgressIndicator());
    //           } else {
    //             return buildTabsList(viewModel.sourceApi.data ?? []);
    //           }
    //         },
    //       );
    //     },
    //   ),
    // );

    // return FutureBuilder(
    //     future: ApiManager.loadSources(widget.category.name),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return AppErrorWidget(message: snapshot.error.toString());
    //       } else if (snapshot.hasData) {
    //         return buildTabsList(snapshot.data!);
    //       } else {
    //         return Center(child: CircularProgrDefaultTabController essIndicator());
    //       }
    //     });
  }

  Widget buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sources
                .map((source) => Tab(child: Text(source.name ?? "")))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsList(source: source))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
