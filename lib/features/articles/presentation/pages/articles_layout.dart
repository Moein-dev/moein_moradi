import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moein_moradi/core/network/app_urls.dart';
import 'package:moein_moradi/core/services/url_launcher.dart';
import 'package:moein_moradi/features/articles/data/models/article_details_model.dart';
import 'package:moein_moradi/features/articles/data/models/article_item_model.dart';
import 'package:moein_moradi/features/articles/presentation/widgets/article_widget.dart';
import 'package:xml2json/xml2json.dart';

class ArticlesLayout extends StatefulWidget {
  const ArticlesLayout({super.key});

  @override
  State<ArticlesLayout> createState() => _ArticlesLayoutState();
}

class _ArticlesLayoutState extends State<ArticlesLayout> {
  final myTransformer = Xml2Json();
  dynamic responseArticle;
  List<ArticleItem> articleItems = [];
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    // Create a client transformer
    final myTransformer = Xml2Json();

    final response = await dio.get(
      AppUrls.getMediumArticles,
    );

    if (response.statusCode == 200) {
      responseArticle = response.data;
      myTransformer.parse(responseArticle);
      var data = myTransformer.toParker();
      var formatJson = json.decode(data);
      ArticleDetails articleDetails =
          ArticleDetails.fromJson(formatJson["rss"]["channel"]);
      setState(() {
        articleItems.addAll(articleDetails.item!);
      });
    } else {
      throw Exception('Failed to load packages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return articleItems.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: articleItems.length,
            itemBuilder: (context, index) {
              ArticleItem item = articleItems[index];
              return ArticleWidget(
                article: item,
                onPressed: () {
                  AppUrlLauncher.webUrl(url: item.link!);
                },
              );
            },
          );
  }
}
