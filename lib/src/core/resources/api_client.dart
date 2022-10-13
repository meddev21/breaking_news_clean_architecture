import 'package:get/get.dart';
import 'package:beaking_news_clean_architecture/src/core/utils/constants.dart';
import 'package:beaking_news_clean_architecture/src/core/params/api_request.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseUrl;
  final Map<String, String> _noTokenHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  ApiClient(this.appBaseUrl){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token= Token;
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token'
    };

  }


  Future<Response> demand(APIRequestParams params) async{
    try {
      final response = await request(
        params.url,
        params.method.string,
        headers: params.headers,
        query: params.query,
        body: params.body,
      );
      return response;
    }catch(e){
        rethrow;
    }
  }

  Future<Response> getData(String uri,{ Map<String, dynamic>? query,}) async{
    try{
      Response response = await get(uri, headers: _setHeaders(), query: query);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  setData(String url,String body) async {
    try{
      Response response = await post(url, body, headers: _setHeaders());
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> setDataNoToken(String uri, String body) async{
    try{
      Response response = await post(uri, body, headers: _noTokenHeaders);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  _setHeaders() =>
      {
        'Content-type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${AppConstants.ACCESS_TOKEN}'
      };
}