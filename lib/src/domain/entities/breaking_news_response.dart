import 'package:equatable/equatable.dart';

import 'article.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

 const BreakingNewsResponse({
    required this.status, 
    required this.totalResults, 
    required this.articles
    });

  @override
  List<Object?> get props => 
  [
    status, 
    totalResults, 
    articles, 
    ];

  @override
  bool get stringify => true;

}