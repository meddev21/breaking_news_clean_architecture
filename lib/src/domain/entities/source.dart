import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'article.dart';

@Entity(
  tableName: SourcesTableName, 
  foreignKeys: [
    ForeignKey(
      childColumns: ['article_id'], 
      parentColumns: ['id'], 
      entity: DBArticle,
      onDelete: ForeignKeyAction.cascade,
      onUpdate: ForeignKeyAction.cascade,
      )
  ],
  )
class Source extends Equatable {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'source_id')
  final int? sourceId;
  final String? id;
  final String? name;

  @ColumnInfo(name: 'article_id')
  final int? articleId;

  const Source({
    this.sourceId,
    this.id,
    this.name,
    this.articleId,
  });
  
  @override
  List<Object?> get props => [id, name, articleId];

  @override
  bool get stringify => true;
}
