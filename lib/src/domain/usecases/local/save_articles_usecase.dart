import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/core/usecases/usecase.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/repositories/articles_repository.dart';

class SaveArticlesUseCase extends UseCase<Either<Failure, List<int>>, List<Article>>{
  final ArticlesRepository _articlesRepository;

  SaveArticlesUseCase(this._articlesRepository);
  
  @override
  Future<Either<Failure, List<int>>> call({required List<Article> params}){
    return _articlesRepository.saveArticles(params);
  }

}