import 'package:beaking_news_clean_architecture/src/domain/entities/breaking_news_response.dart';
import 'article_model/api_article_model.dart';

class BreakingNewsResponseModel extends BreakingNewsResponse{
  const BreakingNewsResponseModel({
    required super.status, 
    required super.totalResults, 
    required super.articles
    });

 factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json)
    { 
      return BreakingNewsResponseModel(
      status: json['status'], 
      totalResults: json['totalResults'], 
      articles: List<APIArticleModel>.from((json['articles'] as List<dynamic>).map(
        (e) => APIArticleModel.fromJson(e as Map<String, dynamic>)))
      );}
  
}