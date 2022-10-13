import 'package:floor/floor.dart';

import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';

@dao
abstract class SourceDao{

  @Query('SELECT * FROM $SourcesTableName')
  Future<List<Source>> getAllSources();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSource(Source source);

  @delete
  Future<void> deleteSource(Source source);

  @Query('DELETE FROM $SourcesTableName')
  Future<void> deleteAllArticles();

}