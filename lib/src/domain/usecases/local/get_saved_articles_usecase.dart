import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/core/usecases/usecase.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/repositories/articles_repository.dart';

class GetSavedArticlesUseCase extends UseCase<Either<Failure, List<Article>>, Unit>{
  final ArticlesRepository _articlesRepository;

  GetSavedArticlesUseCase(this._articlesRepository);
  
  @override
  Future<Either<Failure, List<Article>>> call({required Unit params}) {
   return _articlesRepository.getSavedArticles();
  }
  
}