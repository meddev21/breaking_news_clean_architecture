import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';
import 'package:beaking_news_clean_architecture/src/data/datasources/local/converters/datetime_type_converter.dart';
import 'DAOs/articles_dao.dart';
import 'DAOs/sources_dao.dart';



part 'app_database.g.dart';

@Database(version: 1, entities: [DBArticle, Source])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDao;
  SourceDao get sourceDao;
}