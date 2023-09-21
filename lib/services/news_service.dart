import 'package:dio/dio.dart';
class NewsService {
  static Dio? dio;
  static init() {
    //
    dio = Dio(BaseOptions(
        baseUrl:
            'https://jsonplaceholder.typicode.com',
        receiveDataWhenStatusError: true));
        
  }
 static Future<Response> getNews({required String url,required Map<String,dynamic> qurey}) async{
  return await dio!.get(url,queryParameters: qurey);
 }
}
