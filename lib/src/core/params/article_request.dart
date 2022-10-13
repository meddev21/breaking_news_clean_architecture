import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';

class ArticlesRequestParams{
  final String apiKey;
  final String country;
  final String category;
  int page;
  final int pageSize;

  ArticlesRequestParams({
    this.apiKey = ApiKey,
    this.country = 'us',
    this.category = 'general',
    this.page = 1,
    this.pageSize = 20,
  });

  incrementPage(){
    page++;
  }
}