import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/core/params/article_request.dart';
import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';

abstract class ArticlesRepository{
  // API mehtods
  Future<Either<Failure, List<Article>>> getBreakingNewsArticles(ArticlesRequestParams params);

  // Database methods
  Future<Either<Failure, List<Article>>> getSavedArticles();
  
  Future<Either<Failure, List<int>>> saveArticles(List<Article> articles);

  Future<Either<Failure, int>> removeArticle(Article article);

}