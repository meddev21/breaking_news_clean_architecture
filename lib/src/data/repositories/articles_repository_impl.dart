import 'dart:io';
import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/core/network/network_info.dart';
import 'package:beaking_news_clean_architecture/src/core/params/article_request.dart';
import 'package:beaking_news_clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:beaking_news_clean_architecture/src/core/error/exceptions.dart';
import 'package:beaking_news_clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:beaking_news_clean_architecture/src/data/datasources/local/news_local_service.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  // Api Service
  final NewsApiService newsApiService;
  // Database
  final NewsLocalService newsLocalService;
  // Network Checker
  final NetworkInfo networkInfo;

  ArticlesRepositoryImpl(
      {required this.newsApiService,
      required this.newsLocalService,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params) async {
    if (await networkInfo.isConnected) {
      // getting data from remote
      try {
        print('GETTING FROM INTERNET');
        final response = await newsApiService.getBreakingNewsArticles(params);
        List<Article> articles = response.articles;
        await newsLocalService.saveArticles(articles);
        return Right(articles);
      } on SocketException catch (e) {
        return Left(OfflineFailure(details: e.message));
      } on TimeoutException catch (e) {
        return Left(TimeOutFailure(e.message));
      } on RequestException catch (e) {
        return Left(Failure.responseFailure(e));
      } catch (e) {
        return Left(GlobalFailure(e.toString()));
      }
    } else {
      try {
        // getting data from local
        print('GETTING FROM DATABASE');
        Either<Failure, List<Article>> articles = await getSavedArticles();
        return articles;
      } catch (e) {
        return Left(GlobalFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getSavedArticles() async {
    try {
      List<Article> articles = await newsLocalService.getSavedArticles();
      if (articles.isNotEmpty) {
        return Right(articles);
      } else {
        return const Left(EmptyCacheFailure());
      }
    } catch (e) {
      return Left(GlobalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> removeArticle(Article article) async {
    try {
      int id = await newsLocalService.removeArticle(article);
      return Right(id);
    } catch (e) {
      return Left(GlobalFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<int>>> saveArticles(
      List<Article> articles) async {
    try {
      List<int> articlesId = await newsLocalService.saveArticles(articles);
      return Right(articlesId);
    } catch (e) {
      return Left(GlobalFailure(e.toString()));
    }
  }
}
