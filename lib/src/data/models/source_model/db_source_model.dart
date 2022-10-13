import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';
import 'package:beaking_news_clean_architecture/src/data/models/source_model/api_source_model.dart';


class DBSourceModel extends Source{
 const DBSourceModel({super.id, super.name, super.articleId});

factory DBSourceModel.fromDB(Source source) => 
DBSourceModel(id: source.id, name: source.name);
}