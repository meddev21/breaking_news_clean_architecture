import 'package:beaking_news_clean_architecture/src/domain/entities/Source.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/data/models/source_model/api_source_model.dart';

class APIArticleModel extends Article{
  const APIArticleModel({
    super.source, 
    super.author, 
    super.title, 
    super.description, 
    super.url, 
    super.urlToImage, 
    super.publishedAt, 
    super.content
    });

  factory APIArticleModel.fromJson(Map<String, dynamic> map)
    => 
    APIArticleModel(
    source: APISourceModel.fromJson(map['source']),
    author: map['author']??'none',
    title: map['title'] as String,
    description: map['description'] as String,
    url: map['url'] as String,
    urlToImage: map['urlToImage'] as String,
    publishedAt: map['publishedAt'] as String,
    content: map['content']??'none',
    );
  }
