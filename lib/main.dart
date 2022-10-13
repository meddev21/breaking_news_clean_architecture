import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beaking_news_clean_architecture/src/core/utils/dependency.dart';
import 'package:beaking_news_clean_architecture/src/core/utils/route_helper.dart';

void main() async{
  // Should be the first line in main method, when waiting some data in main we shoud add this line
  WidgetsFlutterBinding.ensureInitialized();

  // Rest of your app code
  await DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context , child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.getInitial(),
        );
      }
    );
  }
}
