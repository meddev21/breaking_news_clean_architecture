import 'package:floor/floor.dart';

import 'package:beaking_news_clean_architecture/src/domain/entities/source.dart';


class SourceTypeConverter extends TypeConverter<Source, String> {

  @override
  Source decode(String databaseValue) {
      final List<String> results = databaseValue.split(',') ?? const ['non', 'non'];
      return Source(id: results[0], name:  results[1]);
  }

  @override
  String encode(Source value) {
      final String result = '${value.id}, ${value.name}';
      return result;
  }

}