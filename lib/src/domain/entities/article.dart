import 'package:floor/floor.dart';
import 'package:equatable/equatable.dart';

import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'source.dart';

class ArticleEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props =>
      [author, title, description, url, urlToImage, publishedAt, content];

  @override
  bool get stringify => true;
}

class Article extends ArticleEntity {
  final Source? source;

  const Article({
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
    this.source,
  });

  @override
  List<Object?> get props => [super.props, source];

  @override
  bool get stringify => true;
}

@Entity(tableName: ArticlesTableName)
class DBArticle extends ArticleEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  const DBArticle(
      {super.author,
      super.title,
      super.description,
      super.url,
      super.urlToImage,
      super.publishedAt,
      super.content,
      this.id});

  @override
  List<Object?> get props => [super.props, id];

  factory DBArticle.toDB(Article article)
    => DBArticle(
    author: article.author,
    title: article.title,
    description: article.description,
    url: article.url,
    urlToImage: article.urlToImage,
    publishedAt: article.publishedAt,
    content: article.content,
    );


}
