import 'package:dio/dio.dart';

class DioHelper {

  static Dio dio = new Dio();

  static init (){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {
          'Content-Type' : 'application/json',
        },
        receiveDataWhenStatusError:  true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = 'ar',
    String? token ,
  }) async
  {
    dio.options.headers={
      'lang' : lang,
      'Authorization' : token,
    };
    return await dio.get(
        url ,
        queryParameters:query,
    );
  }

  static Future<Response> postData ({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token ,
}) async
  {
    // here to add some additional data for header
    dio.options.headers={
      'lang' : lang,
      'Authorization' : token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}