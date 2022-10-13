import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/data/models/source_model/db_source_model.dart';

class DBArticleModel extends Article{
  const DBArticleModel({
    super.source, 
    super.author, 
    super.title, 
    super.description, 
    super.url, 
    super.urlToImage, 
    super.publishedAt, 
    super.content
    });

  factory DBArticleModel.fromDB(DBArticle dbArticle, DBSourceModel dbSource)
    => DBArticleModel(
    source: dbSource,
    author: dbArticle.author,
    title: dbArticle.title,
    description: dbArticle.description,
    url: dbArticle.url,
    urlToImage: dbArticle.urlToImage,
    publishedAt: dbArticle.publishedAt,
    content: dbArticle.content,
    );
  }
