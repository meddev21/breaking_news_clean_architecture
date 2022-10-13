import 'dart:convert';

import 'package:beaking_news_clean_architecture/src/core/resources/api_client.dart';
import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'package:beaking_news_clean_architecture/src/core/params/article_request.dart';
import 'package:beaking_news_clean_architecture/src/core/params/api_request.dart';
import 'package:beaking_news_clean_architecture/src/core/error/exceptions.dart';
import 'package:beaking_news_clean_architecture/src/data/models/breaking_news_response_model.dart';

class NewsApiService {
  final ApiClient _apiClient;

  NewsApiService(this._apiClient);

  Future<BreakingNewsResponseModel> getBreakingNewsArticles(
      ArticlesRequestParams params) async {
    try {
      Map<String, dynamic> query = {
        'country': params.country,
        'category': params.category,
        'page': params.page,
        'pageSize': params.pageSize,
      };

       final Map<String, dynamic>? parsedQuery = query.isNotEmpty
        ? query.map((key, value) => MapEntry(key, value.toString()))
        : null;
      Map<String, String>? headers = {
        "Content-Type": "application/json",
        'X-Api-Key': params.apiKey,
      };
      APIRequestParams apiParams = APIRequestParams(
          url: TopHeadLines,
          method: HTTPMethod.get,
          headers: headers,
          query: parsedQuery);
      final response = await _apiClient.demand(apiParams);
      if (response.isOk) {
        return BreakingNewsResponseModel.fromJson(response.body);
      } else {
        throw RequestException(
            statusCode: response.statusCode,
            statusText: response.statusText,
            details: response.body);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
