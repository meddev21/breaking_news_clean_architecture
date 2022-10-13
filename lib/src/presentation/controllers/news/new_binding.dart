import 'package:get/get.dart';
import 'package:beaking_news_clean_architecture/src/domain/usecases/remote/get_articles_usecase.dart';
import 'package:beaking_news_clean_architecture/src/data/repositories/articles_repository_impl.dart';
import 'news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    // here [GetArticlesUseCase] need ArticlesRepository the abstract not implement but abstract 
    // has no body fuction so we injected with Get.find() with type of the implement [ArticlesRepositoryImpl] 
    Get.lazyPut(() => GetArticlesUseCase(Get.find<ArticlesRepositoryImpl>()));
    Get.lazyPut(() => NewsController(Get.find<GetArticlesUseCase>()));
  }
}
