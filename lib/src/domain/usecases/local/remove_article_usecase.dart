import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/core/usecases/usecase.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/repositories/articles_repository.dart';

class RemoveArticleUseCase extends UseCase<Either<Failure, int>, Article>{
  final ArticlesRepository _articlesRepository;

  RemoveArticleUseCase(this._articlesRepository);
  
  @override
  Future<Either<Failure, int>> call({required Article params}){
    return _articlesRepository.removeArticle(params);
  }

}