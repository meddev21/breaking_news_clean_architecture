import 'package:beaking_news_clean_architecture/src/core/error/failures.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:beaking_news_clean_architecture/src/domain/usecases/remote/get_articles_usecase.dart';
import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
import 'package:beaking_news_clean_architecture/src/core/params/article_request.dart';

class NewsController extends GetxController
    with StateMixin<List<Article>>, ScrollMixin {
  NewsController(this._getArticlesUseCase);

  @override
  void onInit() {
    params = ArticlesRequestParams(pageSize: _pageSize, page: _currentPage);
    fetchData();
    super.onInit();
  }

  final GetArticlesUseCase _getArticlesUseCase;

  late ArticlesRequestParams params;

  int _currentPage = 1;

  int _pageSize = 20;

  var articles = RxList<Article>([]);

  bool haveNext = true;
  // for knwing did I get first chuck of data or no (because whene is true and the new response is
  // null almost mean that no more data or its last page)
  bool hasFirstChunk  = false;

  fetchData() async {
    final either = await _getArticlesUseCase(params: params);
    either.fold((Failure failure) {
      change(null, status: RxStatus.error());
    }, (List<Article> list) {
      if(!hasFirstChunk && list.isEmpty){
        change(null, status: RxStatus.empty());
      }else if(hasFirstChunk && list.isEmpty){
        haveNext = false;
      }else{
        hasFirstChunk = true;
        articles.addAll(list);
        change(articles, status: RxStatus.success());
        params.incrementPage();
      }
    });
    update();
  }

  @override
  Future<void> onTopScroll() async {
    print('onTopScroll');
  }

  @override
  Future<void> onEndScroll() async {
    if(haveNext){
      await fetchData();
    }else{
      Get.snackbar('last page', 'its last page');
    }
  }
}
