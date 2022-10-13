import 'package:floor/floor.dart';

import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';
import 'package:beaking_news_clean_architecture/src/data/datasources/local/app_database.dart';
import 'sources_dao.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $ArticlesTableName')
  Future<List<DBArticle>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertArticle(DBArticle article);

  @Insert(onConflict: OnConflictStrategy.replace)
   Future<void> insertArticleVoid(DBArticle article);


  @delete
  Future<int> deleteArticle(DBArticle article);

  @Query('DELETE FROM $ArticlesTableName')
  Future<void> deleteAllArticles();

  @transaction
  Future<List<int>> insertArticles(
      List<Article> articles, AppDatabase appDatabase) async {
    List<int> articlesId = [];
    for (Article article in articles) {
      DBArticle dbArticle = DBArticle.toDB(article);
      int articleId = await insertArticle(dbArticle);
      Source source = Source(
          id: article.source!.id,
          name: article.source!.name,
          articleId: articleId);
      await appDatabase.sourceDao.insertSource(source);
      articlesId.add(articleId);
    }
    return articlesId;
  }
}
