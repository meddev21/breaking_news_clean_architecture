import 'package:dartz/dartz.dart';

import 'package:beaking_news_clean_architecture/src/core/params/article_request.dart';
import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:beaking_news_clean_architecture/src/core/usecases/usecase.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/domain/repositories/articles_repository.dart';

class GetArticlesUseCase implements UseCase<Either<Failure, List<Article>>, ArticlesRequestParams>{
  final ArticlesRepository _articlesRepository;

  const GetArticlesUseCase(this._articlesRepository);

  @override
  Future<Either<Failure, List<Article>>> call({required ArticlesRequestParams params}) {
    return _articlesRepository.getBreakingNewsArticles(params);
  }

}


