// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:beaking_news_clean_architecture/src/presentation/controllers/news/news_controller.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/presentation/widgets/article_widget.dart';

class BreakingNewsPage extends HookWidget {
  late NewsController controller;

  BreakingNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(controller),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      actions: [
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(NewsController controller) {
    // return _buildArticle(scrollController);
    return controller.obx(
      (state) => ListView.builder(
        controller: controller.scroll,
        itemCount: state?.length,
        itemBuilder: (ctx, index) => ArticleWidget(
          article: state![index],
          onArticlePressed: (article){},
          onRemove: (article){},
          isRemovable: false,
          )
        ),
      onLoading: const Center(child: LinearProgressIndicator()),
      onEmpty: const Center(
        child: Text(
          'Repositories no found',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      onError: (error) => Center(
        child: Text(
          'Error: Cannot get repositories \n$error',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
