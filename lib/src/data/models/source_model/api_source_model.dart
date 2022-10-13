import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';


class APISourceModel extends Source{
 const APISourceModel({super.id, super.name, super.articleId});

factory APISourceModel.fromJson(Map<String, dynamic> json) => 
APISourceModel(id: json['id']??'none', name: json['name'] as String);
}