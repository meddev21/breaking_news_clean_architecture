// // ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import 'package:beaking_news_clean_architecture/src/presentation/controllers/news/news_controller.dart';
// import 'package:beaking_news_clean_architecture/src/domain/entities/article.dart';
// // import 'package:beaking_news_clean_architecture/src/presentation/widgets/';

// class BreakingNewsView extends HookWidget {

//   late NewsController controller;

//   BreakingNewsView({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     controller = Get.find();
//     return Scaffold(
//         appBar: _buildAppBar(),
//         body: _buildBody(),
//       );
//   }

//     PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       leading: Builder(
//         builder: (context) => GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () => Get.back(),
//           child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//         ),
//       ),
//     );
//   }

//     Widget _buildBody() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           _buildArticleTitleAndDate(),
//           _buildArticleImage(),
//           _buildArticleDescription(),
//         ],
//       ),
//     );
//   }

//     Widget _buildArticleTitleAndDate() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 22),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
//           Text(
//             article.title,
//             style: const TextStyle(fontFamily: 'Butler', fontSize: 20, fontWeight: FontWeight.w900),
//           ),

//           const SizedBox(height: 14),
//           // DateTime
//           Row(
//             children: [
//               const Icon(Ionicons.time_outline, size: 16),
//               const SizedBox(width: 4),
//               Text(
//                 article.publishedAt,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildArticleImage() {
//     return Container(
//       width: double.maxFinite,
//       height: 250,
//       margin: const EdgeInsets.only(top: 14),
//       child: Image.network(article.urlToImage, fit: BoxFit.cover),
//     );
//   }

//   Widget _buildArticleDescription() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
//       child: Text(
//         '${article.description ?? ''}\n\n${article.content ?? ''}',
//         style: const TextStyle(fontSize: 16),
//       ),
//     );
//   }

// }