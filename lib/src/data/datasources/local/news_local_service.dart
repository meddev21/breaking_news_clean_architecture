import 'dart:async';

import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:beaking_news_clean_architecture/src/data/models/article_model/db_article_model.dart';
import 'package:beaking_news_clean_architecture/src/data/models/source_model/db_source_model.dart';

class NewsLocalService {
  final AppDatabase _appDatabase;
  NewsLocalService(this._appDatabase);

  Future<List<Article>> getSavedArticles() async {
    List<Article> articles = [];
    // await _appDatabase.articleDao.deleteAllArticles();
    // await _appDatabase.sourceDao.deleteAllArticles();
    try {
      List<DBArticle> dbArticles =
          await _appDatabase.articleDao.getAllArticles();
      List<Source> dbSources = await _appDatabase.sourceDao.getAllSources();
      for (DBArticle dbArticle in dbArticles) {
        Source source =
            dbSources.firstWhere((s) => dbArticle.id == s.articleId);
        DBSourceModel dbSource = DBSourceModel.fromDB(source);
        articles.add(DBArticleModel.fromDB(dbArticle, dbSource));
      }
      return articles;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> removeArticle(Article article) async {
    try {
      DBArticle dbArticle = DBArticle.toDB(article);
      int id = await _appDatabase.articleDao.deleteArticle(dbArticle);
      return id;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> saveArticles(List<Article> articles) async {
    try {
      List<int> articlesId = [];
      for (Article article in articles) {
        DBArticle dbArticle = DBArticle.toDB(article);
        int articleId = await _appDatabase.articleDao.insertArticle(dbArticle);
        Source source = Source(
            id: article.source!.id,
            name: article.source!.name,
            articleId: articleId);
        await _appDatabase.sourceDao.insertSource(source);
        articlesId.add(articleId);
      }
      if (articlesId.isEmpty) {
        throw Exception('the list of articles is empty');
      }
      return articlesId;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
